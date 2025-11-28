/*
This kata is based on “SQL Basics: Simple PIVOTING data”.

You must build a pivot table without using CROSSTAB.
There are two tables: products and details.
Each product can have multiple details, and each detail has a value from: ['good', 'ok', 'bad'].

Your task is to write an SQL query that returns a pivot table with these columns:
    - name - product name;
    - good - count of “good” details;
    - ok - count of “ok” details;
    - bad - count of “bad” details.

The output must be ordered by product name.

Compare your result with the expected table to verify correctness.

Это задание основано на “SQL Basics: Simple PIVOTING data”.

Нужно создать сводную таблицу без использования CROSSTAB.
Даны две таблицы: products и details.
Каждый продукт имеет несколько деталей, и каждая деталь может иметь одно из значений: ['good', 'ok', 'bad'].

Требуется написать SQL-запрос, который вернёт таблицу со столбцами:
    - name - название продукта;
    - good - количество деталей со значением “good”;
    - ok - количество деталей со значением “ok”;
    - bad - количество деталей со значением “bad”.

Результат должен быть отсортирован по имени продукта.

Сравните результат с эталонной таблицей.
*/

SELECT  products.name AS name,
        COUNT(CASE WHEN details.detail = 'good' THEN 1 END) AS good,
        COUNT(CASE WHEN details.detail = 'ok' THEN 1 END) AS ok,
        COUNT(CASE WHEN details.detail = 'bad' THEN 1 END) AS bad
FROM products
LEFT JOIN details
    ON products.id = details.product_id
GROUP BY products.name
ORDER BY products.name ASC;