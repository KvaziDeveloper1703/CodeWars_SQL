/*
You are given a table products with columns id, supplier_id, product_name, and quantity.

Write a SQL query that:
    - Calculates the total number of rows for each supplier_id;
    - Does not use the GROUP BY clause;
    - Produces the same result as grouping by supplier_id;
    - Returns exactly two columns: supplier_id and total_products;
    - Orders the result by supplier_id in descending order.

Дана таблица products с колонками id, supplier_id, product_name и quantity.

Нужно написать SQL-запрос, который:
    - Считает количество строк для каждого supplier_id;
    - Не использует GROUP BY;
    - Даёт тот же результат, что и группировка по supplier_id;
    - Возвращает только supplier_id и total_products;
    - Сортирует результат по supplier_id по убыванию.
*/

SELECT DISTINCT supplier_id, COUNT(id) OVER (PARTITION BY supplier_id) AS total_products
FROM products
ORDER BY supplier_id DESC;