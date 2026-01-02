/*
You are given an employees table with:
    - employee_id
    - date_of_birth

Calculate the percentage of employees in specific age intervals.

Requirements:
    - Compute each employee’s current age using the current date;
    - Group ages into:
        - 18–20 (inclusive);
        - 26–40 (inclusive);
        - >40.
    - Calculate the percentage of total employees in each group;
    - Round percentages to two decimal places;
    - If an age group has no employees, return 0.0.

Output columns:
    - age_interval ('18-20', '26-40', '>40')
    - percent (numeric)

Дана таблица employees со столбцами:
    - employee_id
    - date_of_birth

Определить процент сотрудников в заданных возрастных группах.

Требования:
    - Рассчитать текущий возраст сотрудника по дате рождения;
    - Разбить сотрудников по возрастным интервалам:
        - 18–20 (включительно);
        - 26–40 (включительно);
        - >40.
    - Посчитать процент от общего числа сотрудников в каждой группе;
    - Округлить результат до двух знаков;
    - Если в группе нет сотрудников, вывести 0.0.

Вывод:
    - age_interval
    - percent
*/

WITH employees_with_age AS (
    SELECT employee_id, DATE_PART('year', AGE(CURRENT_DATE, date_of_birth))::int AS age
    FROM employees
),

age_intervals AS (
    SELECT '18-20' AS age_interval
    UNION ALL
    SELECT '26-40'
    UNION ALL
    SELECT '>40'
),

employees_grouped_by_interval AS (
    SELECT
        CASE
            WHEN age BETWEEN 18 AND 20 THEN '18-20'
            WHEN age BETWEEN 26 AND 40 THEN '26-40'
            WHEN age > 40 THEN '>40'
        END AS age_interval
    FROM employees_with_age
    WHERE age >= 18
)

SELECT
    age_intervals.age_interval,
    ROUND(
        COALESCE(
            COUNT(employees_grouped_by_interval.age_interval)::numeric
            / NULLIF((SELECT COUNT(*) FROM employees_with_age WHERE age >= 18), 0)
            * 100,
            0
        ),
        2
    ) AS percent
FROM age_intervals
LEFT JOIN employees_grouped_by_interval ON age_intervals.age_interval = employees_grouped_by_interval.age_interval
GROUP BY age_intervals.age_interval
ORDER BY
    CASE age_intervals.age_interval
        WHEN '18-20' THEN 1
        WHEN '26-40' THEN 2
        WHEN '>40' THEN 3
    END;