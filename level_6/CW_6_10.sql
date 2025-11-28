/*
On Codewars, a bad kata is one that has at least three votes and an average vote below 0.7. Some users created many of these low-quality katas, so authors with five or more bad katas lose their kata-creation privileges.

You have two tables: kata_authors linking users to their katas, and kata_votes storing votes for each kata.

Write an SQL query to find all authors who created five or more bad katas, and return their user_id and the number of their bad katas.

The result must be ordered by the number of bad katas in descending order, and by user_id descending when equal.

На Codewars плохой катой считается та, у которой есть минимум три голоса и средняя оценка ниже 0.7. Авторы, создавшие пять и более таких кат, теряют возможность создавать новые.

Даны таблицы kata_authors и kata_votes. 

Нужно написать SQL-запрос, который найдёт авторов с пятью и более плохими катами и вернёт их user_id и количество плохих кат.

Результат должен быть отсортирован по числу плохих кат по убыванию и при равенстве - по user_id по убыванию.
*/

SELECT bad_katas.user_id, COUNT(*) AS bad_kata_count
FROM (  SELECT kata_authors.user_id, kata_authors.kata_id
        FROM kata_authors
        JOIN kata_votes ON kata_votes.kata_id = kata_authors.kata_id
        GROUP BY kata_authors.user_id, kata_authors.kata_id
        HAVING COUNT(kata_votes.vote) >= 3 AND AVG(kata_votes.vote) < 0.7
) AS bad_katas
GROUP BY bad_katas.user_id
HAVING COUNT(*) >= 5
ORDER BY bad_kata_count DESC, bad_katas.user_id DESC;