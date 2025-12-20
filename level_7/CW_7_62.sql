/*
You have a table products(product_id, product_name, quantity_in_stock).

Write a SQL query that:
    - Repeats each product row as many times as quantity_in_stock;
    - Displays all columns for each repeated row;
    - Sorts the final result by product_id in descending order.

Есть таблица products(product_id, product_name, quantity_in_stock).

Нужно написать SQL-запрос, который:
    - Выводит каждую строку столько раз, сколько указано в quantity_in_stock;
    - Показывает все поля для каждой строки;
    - Сортирует результат по product_id по убыванию.
*/

SELECT products.product_id, products.product_name, products.quantity_in_stock
FROM products
JOIN generate_series(1, products.quantity_in_stock) AS series_number ON true
ORDER BY products.product_id DESC;