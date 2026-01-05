/*
You are given a PostgreSQL table users with user registrations.

Write an SQL query that:
    - Builds a report for all dates between the earliest and latest registration date;
    - Shows the number of registrations per day;
    - Uses 0 for days with no registrations;
    - Calculates an 8-day running average including the current day and previous 7 days;
    - For the first days, averages over the available days;
    - Rounds the average to 2 decimal places;
    - Orders results by date ascending.

Дана таблица users с регистрациями пользователей.

Нужно написать SQL-запрос, который:
    - Формирует отчёт по всем датам от первой до последней регистрации;
    - Показывает количество регистраций в день (sign_ups);
    - Ставит 0, если в этот день не было регистраций;
    - Считает скользящее среднее за 8 дней (avg_signups), включая текущий день и 7 предыдущих;
    - Для первых дат считает среднее по доступному числу дней;
    - Округляет среднее до 2 знаков;
    - Сортирует результат по дате по возрастанию.
*/

WITH date_bounds AS (
    SELECT MIN(registered_at::date) AS start_date, MAX(registered_at::date) AS end_date
    FROM users
),
calendar AS (
    SELECT generate_series(start_date, end_date, INTERVAL '1 day')::date AS date
    FROM date_bounds
),
daily_signups AS (
    SELECT registered_at::date AS date, COUNT(*) AS sign_ups
    FROM users
    GROUP BY registered_at::date
)
SELECT
    calendar.date,
    COALESCE(daily_signups.sign_ups, 0) AS sign_ups,
    ROUND(
        AVG(COALESCE(daily_signups.sign_ups, 0)) OVER (
            ORDER BY calendar.date
            ROWS BETWEEN 7 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS avg_signups
FROM calendar
LEFT JOIN daily_signups ON calendar.date = daily_signups.date
ORDER BY calendar.date;