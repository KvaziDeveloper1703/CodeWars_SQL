/*
You are given a PostgreSQL table sessions with columns:
    - session_id;
    - length_seconds.

Write a SQL query that groups sessions into 5-second intervals.

The result must contain:
    - bucket - text in the format "start-end";
    - count - number of sessions in that interval.

Дана таблица PostgreSQL sessions со столбцами:
    - session_id;
    - length_seconds.

Напишите SQL-запрос, который группирует сессии по интервалам по 5 секунд.

Результат должен содержать:
    - bucket - строка в формате «start-end»;
    - count - количество сессий в данном интервале.
*/

SELECT (bucket_start || '-' || (bucket_start + 4)) AS bucket, COUNT(*) AS count
FROM (  SELECT (length_seconds / 5) * 5 AS bucket_start
        FROM sessions) bucketed_sessions
GROUP BY bucket_start
ORDER BY bucket_start;