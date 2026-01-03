/*
You have two tables: product_orders and inventory_thresholds.

For each row in inventory_thresholds, find the smallest ordered quantity that is greater than or equal to the threshold for the same order_id, and return the corresponding product name.

Requirements:
    - Output columns:
        - order_id;
        - threshold_quantity;
        - next_ge_quantity - the minimal quantity ≥ threshold_quantity from product_orders;
        - product_name - linked to next_ge_quantity.
    - If no such quantity exists, return NULL for next_ge_quantity and product_name;
    - The pair is unique;
    - Sort by order_id ascending, then by threshold_quantity ascending.

Есть две таблицы: product_orders и inventory_thresholds.

Для каждой строки из inventory_thresholds найти минимальное заказанное количество, которое больше либо равно порогу, для того же order_id, и вернуть название товара.

Требования:
    - Выходные столбцы:
        - order_id;
        - threshold_quantity;
        - next_ge_quantity - минимальное quantity ≥ threshold_quantity из product_orders;
        - product_name, соответствующее найденному количеству.
    - Если подходящего значения нет - вернуть NULL;
    - Пара уникальна;
    - Отсортировать по order_id, затем по threshold_quantity.
*/

SELECT inventory_thresholds.order_id, inventory_thresholds.threshold_quantity, next_order.quantity AS next_ge_quantity, next_order.product_name
FROM inventory_thresholds
LEFT JOIN LATERAL (
    SELECT product_orders.quantity, product_orders.product_name
    FROM product_orders
    WHERE product_orders.order_id = inventory_thresholds.order_id AND product_orders.quantity >= inventory_thresholds.threshold_quantity
    ORDER BY product_orders.quantity ASC
    LIMIT 1
) AS next_order
ON TRUE
ORDER BY inventory_thresholds.order_id ASC, inventory_thresholds.threshold_quantity ASC;