/*
You are given an e-commerce database with categories, subcategories, and products that use soft deletion.

Write a SQL query that returns categories whose number of active products was 10 or more 30 days ago, but is less than 10 today.

A product is considered active if deleted_at is NULL or set to a future date.

The result must include: category_id, category name, current_quantity, and quantity_30_days_ago, and be ordered by category_id in descending order.

Дана база данных интернет-магазина с категориями, подкатегориями и товарами, где используется мягкое удаление.

Напиши SQL-запрос, который найдёт категории, в которых количество активных товаров было не менее 10 30 дней назад, но стало меньше 10 на сегодняшний день.

Товар считается активным, если deleted_at NULL или находится в будущем.

Результат должен содержать: category_id, name, current_quantity, quantity_30_days_ago и быть отсортирован по category_id по убыванию.
*/

WITH category_product_counts AS (
    SELECT categories.id AS category_id, categories.name AS category_name,
        COUNT(*) FILTER (WHERE products.deleted_at IS NULL OR products.deleted_at > CURRENT_DATE) AS current_quantity,
        COUNT(*) FILTER (WHERE products.deleted_at IS NULL OR products.deleted_at > CURRENT_DATE - INTERVAL '30 days') AS quantity_30_days_ago
    FROM categories
    JOIN subcategories ON subcategories.category_id = categories.id
    JOIN products ON products.subcategory_id = subcategories.id
    GROUP BY categories.id, categories.name
)
SELECT category_id, category_name AS name, current_quantity, quantity_30_days_ago
FROM category_product_counts
WHERE quantity_30_days_ago >= 10 AND current_quantity < 10
ORDER BY category_id DESC;