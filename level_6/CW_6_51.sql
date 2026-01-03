/*
You are given a table process_times with machine process intervals.

Write a SQL query that calculates the total downtime for each machine, defined as the sum of time gaps between the end of one process and the start of the next process on the same machine.

Rules:
    - Downtime is calculated only between consecutive processes of the same machine;
    - Processes for a machine do not overlap;
    - Exclude machines with:
        - only one process, or
        - no downtime between processes.

Output columns:
    - machine_id
    - total_down_time formatted as HH:MM:SS

Sort results by machine_id in descending order.

Дана таблица process_times с интервалами работы станков.

Написать SQL-запрос, который вычисляет общее время простоя каждого станка — сумму промежутков между окончанием одного процесса и началом следующего на том же станке.

Условия:
    - Простой считается только между последовательными процессами одного станка;
    - Процессы одного станка не перекрываются;
    - Исключить станки:
        - с одним процессом, или
        - без простоев между процессами.

Результат должен содержать:
    - machine_id
    - total_down_time в формате HH:MM:SS

Отсортировать по machine_id по убыванию.
*/

WITH ordered_processes AS (
    SELECT machine_id, start_time, end_time, LEAD(start_time) OVER (PARTITION BY machine_id ORDER BY start_time) AS next_start_time
    FROM process_times
),
downtime AS (
    SELECT machine_id, CAST(EXTRACT(EPOCH FROM (next_start_time - end_time)) AS BIGINT) AS downtime_seconds
    FROM ordered_processes
    WHERE next_start_time IS NOT NULL AND next_start_time > end_time
),
summed AS (
    SELECT machine_id, SUM(downtime_seconds) AS total_seconds
    FROM downtime
    GROUP BY machine_id
)
SELECT machine_id, (total_seconds / 3600)::INT::TEXT || ':' || LPAD(((total_seconds % 3600) / 60)::TEXT, 2, '0') || ':' || LPAD((total_seconds % 60)::TEXT, 2, '0') AS total_down_time
FROM summed
WHERE total_seconds > 0
ORDER BY machine_id DESC;