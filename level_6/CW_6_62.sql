/*
You are given two tables: customers and orders.

Each customer can order only three products: Product 1, Product 2, Product 3.

Write an SQL query that:
    - Finds customers who ordered Product 1 and Product 2;
    - Excludes customers who ordered Product 3;
    - Shows how many times each customer ordered Product 1 and Product 2;
    - Formats the result as: Product 1: N times || Product 2: N times;
    - Orders the result by customer_id in descending order.

Даны таблицы customers и orders.

Клиенты могут заказывать только три товара: Product 1, Product 2, Product 3.

Нужно написать SQL-запрос, который:
    - Выбирает клиентов, заказавших Product 1 и Product 2;
    - Исключает клиентов, заказавших Product 3;
    - Показывает количество заказов Product 1 и Product 2;
    - Формирует строку вида: Product 1: N times || Product 2: N times;
    - Сортирует результат по customer_id по убыванию.
*/

SELECT customers.customer_id, customers.name,
    CONCAT( 'Product 1: ',
        SUM(CASE WHEN orders.product_name = 'Product 1' THEN 1 ELSE 0 END), ' times || Product 2: ',
        SUM(CASE WHEN orders.product_name = 'Product 2' THEN 1 ELSE 0 END), ' times'
    ) AS product_summary
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
HAVING SUM(CASE WHEN orders.product_name = 'Product 1' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN orders.product_name = 'Product 2' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN orders.product_name = 'Product 3' THEN 1 ELSE 0 END) = 0
ORDER BY customers.customer_id DESC;