/*
Create a SQL SELECT statement that returns all columns from the people table and joins it with the toys table so you can return the number of toys each person has.

People table schema:
    - id
    - name

Toys table schema:
    - id
    - name
    - people_id

Your query should return:
    - all fields from the people table;
    - the count of toys for each person, labeled as toy_count.

Создайте SQL-запрос SELECT, который возвращает все столбцы из таблицы people и соединяет её с таблицей toys, чтобы можно было получить количество игрушек у каждого человека.

Схема таблицы people:
    - id
    - name

Схема таблицы toys:
    - id
    - name
    - people_id

Запрос должен вернуть:
    - все поля таблицы people;
    - количество игрушек у каждого человека под именем toy_count.
*/

SELECT people.*, COUNT(toys.id) AS toy_count
FROM people
LEFT JOIN toys
ON people.id = toys.people_id
GROUP BY people.id;