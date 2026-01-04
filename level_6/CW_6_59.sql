/*
You are given a table user_activity containing activity data for registered users and unregistered/deleted users.

Unregistered or deleted users have usernames that match the pattern User followed by digits only.

Table Structure:
User_activity:
    - id (integer) - unique record identifier;
    - username (varchar) - username associated with the activity;
    - activity_count (integer) - number of activities performed.

Write a SQL query that:
    - Filters records where activity_count is between 1 and 2000 inclusive;
    - Groups records by username;
    - Aggregates all usernames matching the pattern User[digits] into a single group named GROUP_OTHERS;
    - Calculates the total activity count for each user (or group);
    - Sorts results so that:
        - GROUP_OTHERS appears first;
        - all other users follow in alphabetical order.

Expected Output Columns:
    - user - username or GROUP_OTHERS;
    - total_activity - total activity count for that user/group.

Дана таблица user_activity, содержащая данные об активности зарегистрированных и незарегистрированных/удалённых пользователей.

Имена незарегистрированных или удалённых пользователей имеют формат User + только цифры.

Структура таблицы:
User_activity:
    - id - уникальный идентификатор записи;
    - username - имя пользователя;
    - activity_count - количество выполненных действий.

Написать SQL-запрос, который:
    - Отбирает записи, где activity_count находится в диапазоне от 1 до 2000 включительно;
    - Группирует данные по имени пользователя;
    - Объединяет всех пользователей с именами формата User[цифры] в одну группу с названием GROUP_OTHERS;
    - Подсчитывает общее количество действий для каждого пользователя или группы;
    - Сортирует результат так, чтобы:
        - GROUP_OTHERS шёл первым;
        - остальные пользователи шли в алфавитном порядке.

Выходные данные:
    - user - имя пользователя или GROUP_OTHERS;
    - total_activity - суммарное количество действий.
*/

SELECT
    CASE
        WHEN username ~ '^User[0-9]+$' THEN 'GROUP_OTHERS'
        ELSE username
    END AS username,
    SUM(activity_count) AS total_activity
FROM user_activity
WHERE activity_count BETWEEN 1 AND 2000
GROUP BY
    CASE
        WHEN username ~ '^User[0-9]+$' THEN 'GROUP_OTHERS'
        ELSE username
    END
ORDER BY
    CASE
        WHEN
            CASE
                WHEN username ~ '^User[0-9]+$' THEN 'GROUP_OTHERS'
                ELSE username
            END = 'GROUP_OTHERS'
        THEN 0
        ELSE 1
    END,
    username;