/*
For this challenge, you need to write a simple SELECT statement that returns all columns from the people table and joins it with the sales table so you can return the COUNT of all sales and RANK each person by their sale count.

People table schema:
    - id
    - name

Sales table schema:
    - id
    - people_id
    - sale
    - price

Your query should return all fields from the people table, along with:
    - sale_count - the number of sales for each person;
    - sale_rank - the rank of each person based on their sale_count.

В этом задании нужно написать простой оператор SELECT, который возвращает все столбцы из таблицы people и делает JOIN с таблицей sales, чтобы можно было получить количество всех продаж и присвоить каждому человеку ранг по количеству его продаж.

Схема таблицы people:
    - id
    - name

Схема таблицы sales:
    - id
    - people_id
    - sale
    - price

Ваш SQL-запрос должен вернуть все поля из таблицы people, а также:
    - sale_count - количество продаж для каждого человека;
    - sale_rank - ранг человека на основе количества продаж.
*/

SELECT  people.id, people.name, COUNT(sales.id) AS sale_count, RANK() OVER (ORDER BY COUNT(sales.id)) AS sale_rank
FROM people
JOIN sales ON sales.people_id = people.id
GROUP BY people.id, people.name;