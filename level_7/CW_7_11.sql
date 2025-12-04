/*
Create a SQL SELECT statement that returns all columns from the products table and joins it with the companies table in order to include the company name.

Products table schema:
    - id
    - name
    - isbn
    - company_id
    - price

Companies table schema:
    - id
    - name

Your query must return:
    - all fields from the products table;
    - the company name from the companies table, labeled as company_name.

Создайте SQL-запрос SELECT, который возвращает все столбцы из таблицы products и выполняет соединение с таблицей companies, чтобы получить название компании.

Схема таблицы products:
    - id
    - name
    - isbn
    - company_id
    - price

Схема таблицы companies:
    - id
    - name

Запрос должен вернуть:
    - все столбцы из таблицы products
    - название компании из таблицы companies под именем company_name
*/

SELECT products.*, companies.name AS company_name
FROM products
JOIN companies
ON products.company_id = companies.id;