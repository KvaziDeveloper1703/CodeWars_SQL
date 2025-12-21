/*
You are given an orders table with product_id, order_id, and quantity. Each row represents one order of a product.

Write a PostgreSQL query that returns:
    - product_id;
    - count: number of orders for the product;
    - ratio: percentage of this product’s orders relative to all orders.

Sort the result by product_id ascending.

Дана таблица orders с полями product_id, order_id, quantity. Каждая строка - один заказ товара.

Нужно написать запрос PostgreSQL, который выводит:
    - product_id.
    - count: количество заказов для товара;
    - ratio: процент заказов этого товара от общего числа заказов;

Отсортировать результат по product_id по возрастанию.
*/

SELECT product_id, COUNT(*) AS count, ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS ratio
FROM orders
GROUP BY product_id
ORDER BY product_id;