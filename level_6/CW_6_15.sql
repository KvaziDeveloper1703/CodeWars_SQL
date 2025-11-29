/*
You must find the top 10 most engaged users on the platform.

Tables:
users:
    - id;
    - username;
    - likes_count;
    - comments_count;
    - shares_count;
    - date_joined.

github_accounts:
    - id;
    - user_id;
    - github_handle.

Engagement formula: engagement_points = likes_count*1 + comments_count*2 + shares_count*3 + 50 bonus if the user has a linked GitHub account.

Ranking rules:
    - Higher engagement_points rank first;
    - If tied → earlier date_joined ranks higher;
    - If still tied → alphabetical order of username.

Output columns:
    - rank;
    - username;
    - engagement_points;
    - date_joined;
    - github_handle.

Return the top 10 users.

Нужно определить топ-10 самых вовлечённых пользователей платформы.

Таблицы:
users:
    - id;
    - username;
    - likes_count;
    - comments_count;
    - shares_count;
    - date_joined.

github_accounts:
    - id;
    - user_id;
    - github_handle.

Формула вовлечённости: engagement_points = лайки*1 + комментарии*2 + шеры*3 + бонус 50 баллов, если привязан GitHub

Правила ранжирования:
    - Сначала по engagement_points;
    - При равенстве → раньше присоединившийся выше;
    - При равенстве → username по алфавиту.

Выводить:
    - rank;
    - username;
    - engagement_points;
    - date_joined;
    - github_handle.

Вывести топ 10 пользователей.
*/

WITH user_engagement_details AS (
    SELECT
        users.id,
        users.username,
        users.date_joined,
        github_accounts.github_handle,
        (
            users.likes_count * 1 +
            users.comments_count * 2 +
            users.shares_count * 3 +
            CASE
                WHEN github_accounts.user_id IS NOT NULL THEN 50
                ELSE 0
            END
        ) AS engagement_points
    FROM users
    LEFT JOIN github_accounts
        ON github_accounts.user_id = users.id
),
ranked_user_engagement AS (
    SELECT
        user_engagement_details.username,
        user_engagement_details.engagement_points,
        user_engagement_details.date_joined,
        user_engagement_details.github_handle,
        RANK() OVER (
            ORDER BY
                user_engagement_details.engagement_points DESC,
                user_engagement_details.date_joined ASC,
                user_engagement_details.username ASC
        ) AS rank
    FROM user_engagement_details
)
SELECT
    ranked_user_engagement.rank,
    ranked_user_engagement.username,
    ranked_user_engagement.engagement_points,
    ranked_user_engagement.date_joined,
    ranked_user_engagement.github_handle
FROM ranked_user_engagement
ORDER BY
    ranked_user_engagement.rank ASC
LIMIT 10;