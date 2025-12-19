/*
You are given a PostgreSQL table orders with columns:
    - id - order ID;
    - customer_id - customer ID;
    - delivery_date - delivery date.

Select distinct customer_id values for which all orders are undelivered.

Return the result sorted by customer_id in descending order.

Дана таблица PostgreSQL orders со столбцами:
    - id - идентификатор заказа;
    - customer_id - идентификатор клиента;
    - delivery_date - дата доставки.

Выбрать уникальные customer_id, у которых все заказы не доставлены.

Отсортировать результат по customer_id по убыванию.
*/

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(delivery_date) = 0
ORDER BY customer_id DESC;