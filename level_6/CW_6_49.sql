/*
You are given two tables: orders and rebates.

Tables:
Orders:
    - id
    - customer_id
    - order_amount
    - order_date

Rebates:
    - id
    - rebate_percentage
    - min_purchase

For each customer, calculate the total order amount in September 2023 and determine the rebate percentage they qualify for.

Requirements:
    - Sum order_amount per customer_id for orders placed in September 2023;
    - Assign the rebate based on min_purchase and total orders;
    - Exclude customers:
        - without orders in September 2023;
        - whose total orders are below the minimum min_purchase.
    - Each customer qualifies for exactly one rebate.

Output columns:
    - customer_id
    - total_orders
    - rebate_percentage

Sort results by customer_id descending.

Даны две таблицы: orders и rebates.
Таблицы:
Orders:
    - id
    - customer_id
    - order_amount
    - order_date

Rebates:
    - id
    - rebate_percentage
    - min_purchase

Для каждого клиента определить сумму заказов за сентябрь 2023 года и соответствующий процент скидки (rebate).

Требования:
    - Посчитать сумму order_amount по каждому customer_id за сентябрь 2023;
    - Определить скидку по значению min_purchase;
    - Исключить клиентов:
        - без заказов в сентябре 2023;
        - с суммой заказов ниже минимального min_purchase.
    - Каждый клиент получает ровно одну скидку.

Вывести:
    - customer_id
    - total_orders
    - rebate_percentage

Отсортировать по customer_id по убыванию.
*/

WITH september_orders AS (
    SELECT customer_id, SUM(order_amount) AS total_orders
    FROM orders
    WHERE order_date >= DATE '2023-09-01' AND order_date <  DATE '2023-10-01'
    GROUP BY customer_id
),
eligible_customers AS (
    SELECT september_orders.customer_id, september_orders.total_orders, rebates.rebate_percentage
    FROM september_orders
    JOIN rebates ON september_orders.total_orders >= rebates.min_purchase
    WHERE rebates.min_purchase = (
        SELECT MAX(min_purchase)
        FROM rebates r
        WHERE september_orders.total_orders >= r.min_purchase
    )
)
SELECT customer_id, total_orders, rebate_percentage
FROM eligible_customers
ORDER BY customer_id DESC;