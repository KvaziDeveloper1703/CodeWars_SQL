/*
You are given a database that stores information about product categories, products, and sales transactions.

Database Schema:
Categories:
    - category_id (integer, primary key) - unique identifier for the category;
    - category_name (varchar)- name of the category.

Products:
    - product_id (integer, primary key) - unique identifier for the product;
    - category_id (integer, foreign key) - references category_id in the categories table;
    - product_name (varchar) - name of the product.

Sales:
    - sale_id (integer, primary key) - unique identifier for the sale;
    - product_id (integer, foreign key) - references product_id in the products table;
    - sale_date (date) - date when the sale occurred;
    - amount (integer) - monetary amount of the sale.

Write an SQL query that calculates, for each category, the total number of sales and the total sales amount that occurred during the previous week.

The term “previous week” refers to the most recent fully completed week, starting on Monday and ending on Sunday, immediately before the current week.

Requirements:
    - Include only sales that occurred during the previous week;
    - For each category, compute:
        - total_products_sold - the number of sales in the previous week;
        - total_sales_amount - the sum of sale amounts in the previous week.
    - The result set must contain the following columns:
        - category_name (text);
        - total_products_sold (integer);
        - total_sales_amount (integer).
    - Categories with no sales in the previous week should still be included with zero values.
    - The results must be ordered:
        - By total_products_sold in descending order;
        - Then by total_sales_amount in descending order;
        - Then by category_name in ascending order.

Дана база данных, содержащая информацию о категориях товаров, товарах и продажах.

Структура базы данных:
Categories:
    - category_id (integer, primary key) - уникальный идентификатор категории;
    - category_name (varchar) - название категории.

Products:
    - product_id (integer, primary key) - уникальный идентификатор товара;
    - category_id (integer, foreign key) - ссылается на category_id в таблице categories;
    - product_name (varchar) - название товара.

Sales:
    - sale_id (integer, primary key) - уникальный идентификатор продажи;
    - product_id (integer, foreign key) - ссылается на product_id в таблице products;
    - sale_date (date) - дата совершения продажи;
    - amount (integer) - сумма продажи в валюте.

Напишите SQL-запрос, который для каждой категории вычисляет общее количество продаж и общую сумму продаж за предыдущую неделю.

Под «предыдущей неделей» понимается последний полностью завершённый календарный период, который начинается в понедельник и заканчивается в воскресенье, непосредственно предшествующий текущей неделе.

Требования:
    - В расчёты должны попадать только продажи, совершённые за предыдущую неделю;
    - Для каждой категории необходимо вычислить:
        - total_products_sold - количество продаж за предыдущую неделю;
        - total_sales_amount - суммарную сумму продаж за предыдущую неделю.
    - Результат запроса должен содержать следующие столбцы:
        - category_name;
        - total_products_sold;
        - total_sales_amount.
    - Категории, по которым не было продаж за предыдущую неделю, также должны присутствовать в результате.
    - Результирующий набор данных должен быть отсортирован:
        - По количеству продаж - по убыванию;
        - Затем по сумме продаж - по убыванию;
        - Затем по названию категории - по возрастанию.
*/

SELECT categories.category_name, COUNT(sales.sale_id) AS total_products_sold, COALESCE(SUM(sales.amount), 0) AS total_sales_amount
FROM categories
JOIN products ON products.category_id = categories.category_id
JOIN sales ON sales.product_id = products.product_id
WHERE sales.sale_date >= date_trunc('week', CURRENT_DATE) - INTERVAL '7 days' AND sales.sale_date <= date_trunc('week', CURRENT_DATE) - INTERVAL '1 day'
GROUP BY categories.category_name
ORDER BY total_products_sold DESC, total_sales_amount DESC, categories.category_name ASC;