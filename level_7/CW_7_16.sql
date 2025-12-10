/*
Rewrite of the assignment requirements:
Create a SELECT statement using the LIKE operator.
List all people whose first_name is at least 6 characters long.

Names table schema:
    - id
    - first_name
    - last_name

Results table schema:
    - first_name
    - last_name

Переформулировка требований задания:
Создайте оператор SELECT, используя LIKE.
Выведите всех людей, у которых first_name содержит не менее 6 символов.

Структура таблицы names:
    - id
    - first_name
    - last_name

Структура таблицы results:
    - first_name
    - last_name
*/

SELECT first_name, last_name
FROM names
WHERE first_name LIKE '______%';