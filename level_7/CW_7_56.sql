/*
You are given a PostgreSQL table user_playlist with columns:
    - user_id - user identifier;
    - video_id - video identifier;
    - time - timestamp when the video was watched.

The table may contain multiple rows for the same user watching the same video.

Write a query that:
    - returns only users who have watched more than two different videos;
    - outputs unique (user_id, video_id) pairs;
    - sorts the result by user_id and video_id in ascending order.

Дана таблица PostgreSQL user_playlist со столбцами:
    - user_id - идентификатор пользователя;
    - video_id - идентификатор видео;
    - time - время просмотра.

В таблице возможны повторные просмотры одного и того же видео одним пользователем.

Написать запрос, который:
    - выбирает только пользователей, посмотревших более двух разных видео;
    - возвращает уникальные пары (user_id, video_id);
    - сортирует результат по user_id и video_id по возрастанию.
*/

WITH distinct_user_videos AS (
    SELECT DISTINCT user_id, video_id
    FROM user_playlist),
users_with_more_than_two_videos AS (
    SELECT user_id
    FROM distinct_user_videos
    GROUP BY user_id
    HAVING COUNT(*) > 2)
SELECT distinct_user_videos.user_id, distinct_user_videos.video_id
FROM distinct_user_videos
JOIN users_with_more_than_two_videos ON distinct_user_videos.user_id = users_with_more_than_two_videos.user_id
ORDER BY distinct_user_videos.user_id, distinct_user_videos.video_id;