/*
You are given data from an e-commerce system that tracks orders and item price changes over time.

Tables:
Orders:
    - order_id - unique identifier of the order;
    - item_id - identifier of the ordered item;
    - order_timestamp - date and time when the order was placed.

Price_changes:
    - id - unique identifier of the price change;
    - item_id - identifier of the item;
    - change_timestamp - date and time when the price changed;
    - new_price - new price after the change.

Using PostgreSQL, write a SQL query that:
    - Matches each order with the price of the item at the time the order was placed;
    - Uses the latest price change at or before the order timestamp;
    - If an order was placed before any price change for that item, return NULL as the price;
    - If order_timestamp is exactly equal to change_timestamp, that price must be applied.

Return the following columns:
    - order_id
    - item_id
    - order_timestamp
    - new_price

Ordering: Sort results by order_id in ascending order.

Даны данные из e-commerce системы, которая отслеживает заказы и изменения цен товаров во времени.

Таблицы:
Orders:
    - order_id - уникальный идентификатор заказа;
    - item_id - идентификатор товара;
    - order_timestamp - дата и время оформления заказа.

Price_changes:
    - id - уникальный идентификатор изменения цены;
    - item_id - идентификатор товара;
    - change_timestamp - дата и время изменения цены;
    - new_price - новая цена товара.

Используя PostgreSQL, написать SQL-запрос, который:
    - Определяет цену товара на момент оформления заказа;
    - Использует последнее изменение цены, произошедшее до или в момент заказа;
    - Если заказ был оформлен до первого изменения цены, значение new_price должно быть NULL;
    - Если время заказа точно совпадает с change_timestamp, применяется эта цена.

Результат должен содержать:
    - order_id
    - item_id
    - order_timestamp
    - new_price

Сортировка: По order_id по возрастанию.
*/

SELECT orders.order_id, orders.item_id, orders.order_timestamp::text AS order_timestamp, price_changes_at_order.new_price
FROM orders
LEFT JOIN LATERAL (
    SELECT price_changes.new_price
    FROM price_changes
    WHERE price_changes.item_id = orders.item_id AND price_changes.change_timestamp <= orders.order_timestamp
    ORDER BY price_changes.change_timestamp DESC
    LIMIT 1
) AS price_changes_at_order
ON TRUE
ORDER BY orders.order_id ASC;