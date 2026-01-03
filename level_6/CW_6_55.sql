/*
You have two tables: customer_preferences and order_info.

Write a SQL query that assigns a rank to each unique combination from customer_preferences, ordered by:
    - town (A-Z),
    - property_type (A-Z).

Requirements:
    - Include all (town, property_type) combinations from customer_preferences, even if there are no orders;
    - Join to order_info by customer_id; if no order exists, show NULL for order_id.
    - Output columns:
        - rank_order
        - town
        - property_type
        - customer_id
        - order_id

Sort results by rank_order, then customer_id, then order_id - all ascending.

Есть две таблицы: customer_preferences и order_info.

Написать SQL-запрос, который присваивает ранг каждой уникальной паре (town, property_type) из customer_preferences, упорядочивая по:
    - town;
    - property_type.

Требования:
    - Включить все комбинации (town, property_type) из customer_preferences, даже если заказов нет;
    - Связать с order_info по customer_id; при отсутствии заказа вывести NULL в order_id;
    - Выходные столбцы:
        - rank_order;
        - town;
        - property_type;
        - customer_id;
        - order_id.

Отсортировать по rank_order, затем по customer_id, затем по order_id.
*/

WITH ranked_combinations AS (
    SELECT DENSE_RANK() OVER (ORDER BY town ASC, property_type ASC) AS rank_order, town, property_type
    FROM customer_preferences
    GROUP BY town, property_type
)
SELECT ranked_combinations.rank_order, ranked_combinations.town, ranked_combinations.property_type, customer_preferences.customer_id, order_info.order_id
FROM ranked_combinations
JOIN customer_preferences ON customer_preferences.town = ranked_combinations.town AND customer_preferences.property_type = ranked_combinations.property_type
LEFT JOIN order_info ON order_info.customer_id = customer_preferences.customer_id
ORDER BY ranked_combinations.rank_order ASC, customer_preferences.customer_id ASC, order_info.order_id ASC;