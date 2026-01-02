/*
You are given two tables: users and tickets.

Each user has a unique user_id, but may enter different user_name values when creating support tickets.

Find users (user_id) who have used more than one distinct username across their tickets.

Requirements:
    - Usernames must be compared case-insensitively;
    - Output one row per distinct username for each such user_id;
    - If the same username appears in different cases, select the version from the latest ticket.

Results must be ordered:
    - By user_id ascending;
    - By user_name ascending.

Output:
    - user_id;
    - user_name.

Даны две таблицы: users и tickets.

Каждый пользователь имеет уникальный user_id, но может указывать разные user_name при создании тикетов.

Найти пользователей (user_id), которые использовали более одного уникального имени пользователя в своих тикетах.

Требования:
    - Имена сравниваются без учёта регистра;
    - В результате - одна строка на каждое уникальное имя для каждого user_id;
    - Если одно и то же имя встречается в разных регистрах, выбрать вариант из последнего тикета.

Сортировка результата:
    - По user_id по возрастанию;
    - По user_name по алфавиту без учёта регистра.

Вывод:
    - user_id;
    - user_name.
*/

WITH ranked_ticket_user_names AS (
    SELECT
        tickets.user_id AS user_id,
        LOWER(tickets.user_name) AS user_name_case_insensitive,
        tickets.user_name AS original_user_name,
        tickets.id AS ticket_id,
        ROW_NUMBER() OVER (
            PARTITION BY
                tickets.user_id,
                LOWER(tickets.user_name)
            ORDER BY
                tickets.id DESC
        ) AS row_number_by_latest_ticket
    FROM tickets
),
latest_user_names_per_case_insensitive_name AS (
    SELECT user_id, user_name_case_insensitive, original_user_name
    FROM ranked_ticket_user_names
    WHERE row_number_by_latest_ticket = 1
),
users_with_multiple_distinct_names AS (
    SELECT user_id
    FROM latest_user_names_per_case_insensitive_name
    GROUP BY user_id
    HAVING COUNT(*) > 1
)
SELECT latest_user_names.user_id, latest_user_names.original_user_name AS user_name
FROM latest_user_names_per_case_insensitive_name AS latest_user_names
JOIN users_with_multiple_distinct_names AS users_with_multiple_names ON latest_user_names.user_id = users_with_multiple_names.user_id
ORDER BY latest_user_names.user_id ASC, LOWER(latest_user_names.original_user_name) ASC;