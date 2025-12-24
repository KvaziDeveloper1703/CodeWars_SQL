/*
You are given an employee_attendance table with employee work dates.

Write an SQL query for year 2023 to analyze weekend work:
    - A weekend consists of Saturday and Sunday;
    - Consecutive Saturday + Sunday count as one weekend.
    - Count:
        - weekends_worked: number of unique weekends an employee worked at least one day;
        - total_weekend_days_worked: total number of weekend days worked.
    - Each employee appears at most once per day.

Output columns:
    - employee_id
    - weekends_worked
    - total_weekend_days_worked

Sorting:
    - weekends_worked DESC
    - total_weekend_days_worked DESC
    - employee_id DESC

Дана таблица employee_attendance с датами выхода сотрудников на работу.

Напишите SQL-запрос для анализа работы по выходным за 2023 год:
    - Выходные - суббота и воскресенье;
    - Суббота + воскресенье подряд считаются одним уикендом;
    - Нужно посчитать:
        - weekends_worked: количество уникальных уикендов, когда сотрудник работал хотя бы один день;
        - total_weekend_days_worked: общее число отработанных выходных дней.
    - Один сотрудник - не более одной записи в день.

Результат:
    - employee_id
    - weekends_worked
    - total_weekend_days_worked

Сортировка:
    - weekends_worked по убыванию
    - total_weekend_days_worked по убыванию
    - employee_id по убыванию
*/

WITH weekend_attendance AS (
    SELECT employee_id, attendance_date,
        CASE
            WHEN EXTRACT(DOW FROM attendance_date) = 6 THEN attendance_date
            WHEN EXTRACT(DOW FROM attendance_date) = 0 THEN attendance_date - INTERVAL '1 day'
        END AS weekend_start
    FROM employee_attendance
    WHERE attendance_date BETWEEN DATE '2023-01-01' AND DATE '2023-12-31' AND EXTRACT(DOW FROM attendance_date) IN (0, 6)
)

SELECT employee_id, COUNT(DISTINCT weekend_start) AS weekends_worked, COUNT(*) AS total_weekend_days_worked
FROM weekend_attendance
GROUP BY employee_id
ORDER BY weekends_worked DESC, total_weekend_days_worked DESC, employee_id DESC;