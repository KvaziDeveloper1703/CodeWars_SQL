/*
You are given two PostgreSQL tables: employees and employee_works.

Tables:
Employees:
    - id (int) - primary key
    - employee_name (string)

Employee_works:
    - id (int) - primary key
    - employee_id (int) - references employees.id
    - start_date (timestamp)
    - finish_date (timestamp, nullable)

finish_date IS NULL means the employee is currently working.

Write an SQL query that returns, for each employee:
    - id;
    - employee_name;
    - status:
        - 'Still with us' - employee has an ongoing work period;
        - 'Left' - employee worked before but has no ongoing period;
        - 'Never worked' - employee has no records in employee_works.
    - total_duration (interval):
        - If currently working: sum all work periods, using current_date for ongoing periods;
        - If left: sum durations of all finished periods;
        - If never worked: NULL.

Даны две таблицы PostgreSQL: employees и employee_works.

Таблицы:
Employees:
    - id (int) - первичный ключ
    - employee_name (string)

Employee_works:
    - id (int) - первичный ключ
    - employee_id (int) - внешний ключ на employees.id
    - start_date (timestamp)
    - finish_date (timestamp, может быть NULL)

finish_date IS NULL означает, что сотрудник работает в данный момент.

Напишите SQL-запрос, который для каждого сотрудника выводит:
    - id;
    - employee_name;
    - status:
        - 'Still with us' - есть текущий период работы;
        - 'Left' - сотрудник работал ранее, но сейчас не работает;
        - 'Never worked' - нет записей в employee_works.
    - total_duration (interval):
        - Если работает сейчас - суммарная длительность всех периодов с использованием current_date;
        - Если уволен - сумма всех завершённых периодов;
        - Если не работал - NULL.
*/

WITH employee_work_statistics AS (
    SELECT
        employee_id,
        BOOL_OR(finish_date IS NULL) AS is_currently_working,
        SUM(
            CASE
                WHEN finish_date IS NOT NULL
                    THEN finish_date - start_date
                ELSE INTERVAL '0'
            END
        ) AS finished_work_duration,
        MAX(
            CASE
                WHEN finish_date IS NULL
                    THEN start_date
                ELSE NULL
            END
        ) AS current_work_start_date
    FROM employee_works
    GROUP BY employee_id
)
SELECT
    employees.id,
    employees.employee_name,
    CASE
        WHEN employee_work_statistics.employee_id IS NULL
            THEN 'Never worked'
        WHEN employee_work_statistics.is_currently_working
            THEN 'Still with us'
        ELSE 'Left'
    END AS status,
    CASE
        WHEN employee_work_statistics.employee_id IS NULL
            THEN NULL
        WHEN employee_work_statistics.is_currently_working
            THEN employee_work_statistics.finished_work_duration
                 + (current_date - employee_work_statistics.current_work_start_date)
        ELSE employee_work_statistics.finished_work_duration
    END AS total_duration
FROM employees
LEFT JOIN employee_work_statistics
    ON employee_work_statistics.employee_id = employees.id
ORDER BY employees.id DESC;