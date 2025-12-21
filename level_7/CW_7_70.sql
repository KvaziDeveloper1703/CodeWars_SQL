/*
You have tables users, products, and orders.

Write an SQL query that returns IDs and names of users who ordered every product at least once.

Rules:
    - A user must have at least one order for each product in products;
    - Result must be ordered by user_id in descending order.

Даны таблицы users, products и orders.

Нужно написать SQL-запрос, который возвращает ID и имена пользователей, заказавших каждый продукт хотя бы один раз.

Условия:
    - У пользователя должен быть заказ для каждого продукта из таблицы products;
    - Результат отсортировать по user_id по убыванию.
*/

SELECT users.id AS user_id, users.name
FROM users
JOIN orders ON orders.user_id = users.id
GROUP BY users.id, users.name
HAVING COUNT(DISTINCT orders.product_id) = (SELECT COUNT(*) FROM products)
ORDER BY user_id DESC;