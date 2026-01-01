/*
Write a PostgreSQL query to identify narcissistic coders.

Definitions:
    - A user solves a kata if they have at least one solution for it;
    - Users may submit multiple solutions per kata;
    - A self-vote is a vote where voter_user_id = user_id.

Narcissistic coder criteria:
    - The user has solved at least 30 distinct katas;
    - The user has self-voted solutions in at least 25% of those distinct katas.

Required output:
    - user_id
    - username
    - self_vote_percentage

Order by user_id DESC.

Напишите PostgreSQL-запрос для выявления нарциссичных программистов.

Определения:
    - Пользователь считается решившим кату, если у него есть хотя бы одно решение;
    - Для одной каты может быть несколько решений;
    - Самоголосование - это голос, где voter_user_id = user_id.

Критерии нарциссичного программиста:
    - Пользователь решил не менее 30 различных кат;
    - Не менее 25% этих кат имеют хотя бы одно решение с самоголосованием.

Необходимо вывести:
    - user_id
    - username
    - self_vote_percentage

По user_id по убыванию.
*/

WITH solved_katas_per_user AS (
    SELECT DISTINCT solutions.user_id, solutions.kata_id
    FROM solutions
),
self_voted_katas_per_user AS (
    SELECT DISTINCT solutions.user_id, solutions.kata_id
    FROM solutions
    JOIN votes ON votes.solution_id = solutions.solution_id AND votes.voter_user_id = solutions.user_id
),
user_kata_statistics AS (
    SELECT users.user_id, users.username, COUNT(DISTINCT solved_katas_per_user.kata_id) AS total_solved_katas, COUNT(DISTINCT self_voted_katas_per_user.kata_id) AS self_voted_katas
    FROM users
    JOIN solved_katas_per_user ON solved_katas_per_user.user_id = users.user_id
    LEFT JOIN self_voted_katas_per_user ON self_voted_katas_per_user.user_id = users.user_id AND self_voted_katas_per_user.kata_id = solved_katas_per_user.kata_id
    GROUP BY users.user_id, users.username
)
SELECT user_id, username, ROUND((self_voted_katas::numeric / total_solved_katas) * 100, 2) AS self_vote_percentage
FROM user_kata_statistics
WHERE total_solved_katas >= 30 AND (self_voted_katas::numeric / total_solved_katas) >= 0.25
ORDER BY user_id DESC;