/*
You are working with a hospital that tracks patient admissions and discharges. Management wants a daily report that shows how many patients were admitted, how many were discharged, the net change for each day, and the cumulative net change over time. The data comes from two tables: one containing admissions with a join_date, and one containing exits with an exit_date.

Write an SQL query that produces a report with the date, the number of admissions that day, the number of discharges that day, the net change (admissions minus discharges), and the running cumulative net change. Only include dates where at least one admission or discharge occurred, and sort the results by the date in ascending order.

Using the sample data, the expected output shows the hospital’s daily patient flow with joins, exits, net values, and cumulative_net.

Вы работаете с больницей, которая отслеживает поступления и выписки пациентов. Руководству нужен ежедневный отчёт с количеством поступлений, количеством выписок, чистым изменением числа пациентов за день и накопительным изменением со временем. Данные берутся из двух таблиц: одна содержит поступления с датой join_date, другая - выписки с датой exit_date.

Нужно написать SQL-запрос, который выводит дату, количество поступлений за этот день, количество выписок, чистое изменение (поступления минус выписки) и накопительное изменение. В отчёт должны попадать только те дни, когда были поступления или выписки. Результат сортируется по дате по возрастанию.

На основе приведённых данных ожидается таблица, показывающая ежедневную динамику пациентов с колонками joins, exits, net и cumulative_net.
*/

WITH admissions_by_date AS (
    SELECT
        CAST(join_date AS DATE) AS event_date,
        COUNT(*) AS total_joins
    FROM admissions
    GROUP BY CAST(join_date AS DATE)
),
exits_by_date AS (
    SELECT
        CAST(exit_date AS DATE) AS event_date,
        COUNT(*) AS total_exits
    FROM exits
    GROUP BY CAST(exit_date AS DATE)
),
combined_events AS (
    SELECT
        event_date,
        COALESCE(total_joins, 0) AS total_joins,
        COALESCE(total_exits, 0) AS total_exits
    FROM admissions_by_date
    FULL OUTER JOIN exits_by_date
        USING (event_date)
),
final_report AS (
    SELECT
        event_date,
        total_joins,
        total_exits,
        (total_joins - total_exits) AS net_change
    FROM combined_events
)
SELECT
    event_date AS date,
    total_joins AS joins,
    total_exits AS exits,
    net_change AS net,
    SUM(net_change) OVER (ORDER BY event_date) AS cumulative_net
FROM final_report
ORDER BY event_date;