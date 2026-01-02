/*
You are given a groups table with columns:
    - employee_id
    - group_name

Find groups that have exactly the same set of employees as a given group.

Requirements:
    - Create a prepared PostgreSQL statement named find_groups_with_matching_employees;
    - The statement takes one parameter: a group name (text), referenced as $1;
    - Return only groups whose employee sets exactly match the given group;
    - Output columns:
        - group_name
        - employees
    - Order results by group_name ascending;
    - Do not include the input group itself in the result.

Дана таблица groups со столбцами:
    - employee_id
    - group_name

Найти группы, у которых точно такой же набор сотрудников, как у заданной группы.

Требования:
    - Создать подготовленный SQL-запрос PostgreSQL с именем find_groups_with_matching_employees;
    - Запрос принимает один параметр — имя группы (text), используется $1;
    - Вернуть только группы с полностью совпадающим набором сотрудников;
    - Результат должен содержать:
        - group_name
        - employees
    - Отсортировать результат по group_name по возрастанию;
    - Не включать исходную группу в результат.
*/

PREPARE find_groups_with_matching_employees (text) AS
WITH grouped_employees AS (
    SELECT group_name, ARRAY_AGG(employee_id ORDER BY employee_id) AS employees
    FROM groups
    GROUP BY group_name
),
target_group AS (
    SELECT employees
    FROM grouped_employees
    WHERE group_name = $1
)
SELECT grouped_employees.group_name, grouped_employees.employees
FROM grouped_employees
JOIN target_group ON grouped_employees.employees = target_group.employees
WHERE grouped_employees.group_name <> $1
ORDER BY grouped_employees.group_name ASC;