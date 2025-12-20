/*
You have a PostgreSQL table orders(order_id, product_id).

Write a query that returns all orders sorted as follows:
    - Orders with duplicated product_id must come first;
    - These orders must be grouped by product_id;
    - Groups are ordered by the smallest order_id in each group;
    - Inside each group, rows are ordered by order_id ascending;
    - Orders with unique product_id come after all duplicated groups, also sorted by order_id.

Есть таблица PostgreSQL orders(order_id, product_id).

Нужно написать запрос, который выводит заказы со следующей сортировкой:
    - Сначала идут заказы с повторяющимся product_id;
    - Такие заказы должны быть сгруппированы по product_id;
    - Группы сортируются по минимальному order_id в группе;
    - Внутри группы строки сортируются по order_id по возрастанию;
    - Заказы с уникальным product_id идут после всех групп, также по order_id.
*/

SELECT order_id, product_id
FROM (  SELECT order_id, product_id, COUNT(*) OVER (PARTITION BY product_id) AS cnt, MIN(order_id) OVER (PARTITION BY product_id) AS min_order_id
        FROM orders) t
ORDER BY CASE WHEN cnt > 1 THEN 0 ELSE 1 END, min_order_id, order_id;