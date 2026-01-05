/*
You are given a table cars where each row represents one journey.

Write a SQL query that:
    - Selects data for July 16, 2023 from 08:00 to 18:00;
    - Groups journeys by hour;
    - Calculates the total kilometers per hour;
    - Treats records exactly on the hour as belonging to the next hour;
    - Produces a running total of kilometers;
    - Formats the running total as: Total of N hour(s): X;
    - Outputs time_from, time_to, km, and total_km;
    - Orders results by time_from ascending.

Дана таблица cars, где каждая строка - одна поездка.

Нужно написать SQL-запрос, который:
    - Выбирает данные за 16 июля 2023 с 08:00 до 18:00;
    - Группирует поездки по часам;
    - Считает суммарное расстояние за каждый час;
    - Относит записи ровно на границе часа к следующему часу;
    - Считает накопительный итог километров;
    - Форматирует его как: Total of N hour(s): X;
    - Возвращает столбцы time_from, time_to, km, total_km;
    - Сортирует результат по time_from по возрастанию.
*/

WITH hourly_aggregation AS (
    SELECT date_trunc('hour', time) AS time_from, SUM(km) AS km
    FROM cars
    WHERE time >= TIMESTAMP '2023-07-16 08:00:00' AND time <  TIMESTAMP '2023-07-16 18:00:00'
    GROUP BY date_trunc('hour', time)
),
running_totals AS (
    SELECT
        time_from,
        time_from + INTERVAL '1 hour' AS time_to,
        ROUND(km, 1) AS km,
        ROUND(SUM(km) OVER (ORDER BY time_from), 1) AS running_km,
        ROW_NUMBER() OVER (ORDER BY time_from) AS hour_number
    FROM hourly_aggregation
)
SELECT
    time_from::text AS time_from,
    time_to::text   AS time_to,
    km,
    'Total of ' || hour_number || ' hour(s): ' || running_km AS total_km
FROM running_totals
ORDER BY time_from;