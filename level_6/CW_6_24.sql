/*
You are given a table access_logs with badge swipe records.

For each employee, find the time difference between their two most recent accesses to different zones.

Rules:
    - Only different zones count;
    - For each zone, consider only the most recent access;
    - An employee must have accessed at least two different zones;
    - Each employee appears once;
    - Time difference must be non-negative.

Output:
    - employee_id
    - seconds_diff

Sorting:
    - By seconds_diff ASC;
    - Then by employee_id ASC.

Дана таблица access_logs с логами проходов по зонам безопасности.

Для каждого сотрудника найти разницу во времени между двумя самыми последними входами в разные зоны.

Правила:
    - Учитываются только разные зоны;
    - Для каждой зоны берётся последний проход;
    - Сотрудник должен посетить минимум две разные зоны;
    - Каждый сотрудник выводится один раз;
    - Разница времени всегда неотрицательная.

Выходные данные:
    - employee_id
    - seconds_diff

Сортировка:
    - По seconds_diff по возрастанию;
    - Затем по employee_id по возрастанию.
*/

WITH latest_per_zone AS (
    SELECT employee_id, zone, MAX(access_time) AS access_time
    FROM access_logs
    GROUP BY employee_id, zone
),
ranked AS (
    SELECT employee_id, access_time, ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY access_time DESC) AS rn
    FROM latest_per_zone
)
SELECT employee_id, ABS(EXTRACT(EPOCH FROM (MAX(access_time) - MIN(access_time)))) AS seconds_diff
FROM ranked
WHERE rn <= 2
GROUP BY employee_id
HAVING COUNT(*) = 2
ORDER BY seconds_diff ASC, employee_id ASC;