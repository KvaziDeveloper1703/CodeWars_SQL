/*
You have an employees table with employee data.

Write an SQL query that returns the full row of the 3rd oldest employee in the backend team.

Conditions:
    - Consider only employees from the backend team;
    - Older employee = earlier birth_date;
    - No two employees share the same birth date;
    - Do NOT use LIMIT, FETCH, or window functions.

Дана таблица employees с данными сотрудников.

Нужно написать SQL-запрос, который возвращает полную запись 3-го по возрасту (3-й самый старший) сотрудника команды backend.

Условия:
    - Учитывать только сотрудников команды backend;
    - Более старший = более ранняя birth_date;
    - Одинаковых дат рождения нет;
    - Запрещено использовать LIMIT, FETCH и оконные функции.
*/

SELECT employee_outer.employee_id, employee_outer.full_name, employee_outer.team, employee_outer.birth_date
FROM employees AS employee_outer
WHERE employee_outer.team = 'backend' AND (
    SELECT COUNT(*)
    FROM employees AS employee_inner
    WHERE employee_inner.team = 'backend' AND employee_inner.birth_date < employee_outer.birth_date) = 2;