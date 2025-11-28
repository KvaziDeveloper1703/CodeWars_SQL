/*
You have a table employees with the following columns:
    - employee_id - unique ID;
    - full_name - employee’s name;
    - team - one of: "backend", "frontend", "devops", "design";
    - birth_date - employee’s date of birth.

The company wants to find the youngest employee in each team. Assume no ties for youngest employees.

Write an SQL query that returns the full record of the youngest member from each team, without using GROUP BY or aggregate functions.

Order the results by team alphabetically.

Есть таблица employees со столбцами:
    - employee_id - уникальный ID;
    - full_name - имя сотрудника;
    - team - одна из команд: "backend", "frontend", "devops", "design";
    - birth_date - дата рождения.

Нужно найти самого молодого сотрудника в каждой команде. Предполагается, что совпадений по дате нет.

Написать SQL-запрос, который выводит полную запись самого молодого сотрудника каждой команды, без GROUP BY и без агрегатных функций.

Отсортировать результат по полю team в алфавитном порядке.
*/

SELECT *
FROM employees
WHERE NOT EXISTS (  SELECT 1
                    FROM employees
                    WHERE employees.team = employees.team AND employees.birth_date > employees.birth_date
                )
ORDER BY team ASC;