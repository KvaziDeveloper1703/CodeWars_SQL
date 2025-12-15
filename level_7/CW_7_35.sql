/*
You are working with a database that stores topics, votes, and visits.

Your task is to fix an SQL query that calculates:
    - the total sum of vote ratings for each topic;
    - the total number of visits for each topic.

Problems with the current query:
    - The total votes and visits are overcounted due to incorrect joins;
    - If a topic has no votes and no visits, the total vote sum is returned as NULL instead of 0;
    - The result must correctly show 0 votes when there are no votes.

Requirements:
    - Return: topic.id, total_rating, total_visits;
    - Handle topics with zero votes and/or zero visits;
    - Ensure total_rating is 0, not NULL;
    - Sort results by topic.id in descending order.

У вас есть база данных с таблицами topics, votes и visits.

Нужно исправить SQL-запрос, который считает:
    - сумму рейтингов голосов для каждой темы;
    - количество посещений каждой темы.

Проблемы текущего запроса:
    - Голоса и посещения завышены из-за некорректных JOIN;
    - Если у темы нет голосов и нет посещений, сумма голосов возвращается как NULL, а должна быть 0;
    - При отсутствии голосов значение должно быть 0, а не NULL.

Требования:
    - Вывести: topic.id, total_rating, total_visits;
    - Корректно обрабатывать темы без голосов и/или посещений;
    - total_rating всегда должен быть 0 вместо NULL;
    - Сортировка по topic.id по убыванию.
*/

SELECT  topics.id,
        COALESCE(votes_aggregation.total_rating, 0) AS total_rating,
        COALESCE(visits_aggregation.total_visits, 0) AS total_visits
FROM topics
LEFT JOIN (
    SELECT  votes.content_id,
            SUM(votes.rating) AS total_rating
    FROM votes
    GROUP BY votes.content_id
) AS votes_aggregation ON votes_aggregation.content_id = topics.id
LEFT JOIN (
    SELECT  visits.content_id,
            COUNT(*) AS total_visits
    FROM visits
    GROUP BY visits.content_id
) AS visits_aggregation ON visits_aggregation.content_id = topics.id
ORDER BY topics.id DESC;