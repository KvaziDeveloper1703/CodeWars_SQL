/*
You have a table user_roles(id, username, role).

Write an SQL query that:
    - Selects users who have only one of the roles: admin or internal (but not both);
    - Excludes users who have both roles or neither;
    - Returns columns: username, internal (boolean), admin (boolean);
    - Sorts the result by username in ascending order.

Есть таблица user_roles(id, username, role).

Нужно написать SQL-запрос, который:
    - Выбирает пользователей, у которых есть только одна роль: admin или internal (но не обе);
    - Исключает пользователей с обеими ролями или без них;
    - Возвращает столбцы: username, internal (boolean), admin (boolean);
    - Сортирует результат по username по возрастанию.
*/

SELECT username, BOOL_OR(role = 'internal') AS internal, BOOL_OR(role = 'admin') AS admin
FROM user_roles
GROUP BY username
HAVING BOOL_OR(role = 'internal') <> BOOL_OR(role = 'admin')
ORDER BY username ASC;