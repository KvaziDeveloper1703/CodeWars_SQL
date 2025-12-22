/*
You are given a PostgreSQL table employees with columns: id, name, manager_id.

Write an SQL query that:
    - Lists all managers and their employees;
    - Returns:
        - manager_id;
        - employee_names: an array of strings in the format name.
    - Orders employees by id ASC inside each array;
    - Excludes rows where manager_id is NULL;
    - Orders the result by manager_id ASC.

Дана таблица PostgreSQL employees с полями: id, name, manager_id.

Нужно написать SQL-запрос, который:
    - Выводит всех менеджеров и их сотрудников;
    - Возвращает:
        - manager_id;
        - employee_names: массив строк формата имя.
    - Сортирует сотрудников по id по возрастанию внутри массива;
    - Исключает строки с manager_id = NULL;
    - Сортирует результат по manager_id по возрастанию.
*/

SELECT  employees.manager_id,
        ARRAY_AGG(
            employees.name || ' (' || employees.id || ')'
            ORDER BY employees.id ASC
        ) AS employee_names
FROM employees
WHERE employees.manager_id IS NOT NULL
GROUP BY employees.manager_id
ORDER BY employees.manager_id ASC;