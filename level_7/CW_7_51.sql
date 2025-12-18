/*
You are given two tables: table_sales and table_returns.

Both store product transactions with the same structure: product_id, quantity, and date.

Write a query to combine sales and returns into a single result with the following columns:
    - product_id;
    - sale_qty - quantity sold on that date;
    - return_qty - quantity returned on that date;
    - date.

Conditions:
    - For each product_id and date, there is at most one sale and one return;
    - Include all dates that appear in either table;
    - Sort the result by product_id and date in ascending order.

Даны две таблицы: table_sales и table_returns.

Обе содержат данные о продажах и возвратах товаров с полями product_id, quantity и date.

Нужно получить объединённый результат со столбцами:
    - product_id;
    - sale_qty - количество проданных товаров за дату;
    - return_qty - количество возвращённых товаров за дату;
    - date.

Условия:
    - Для каждого product_id и date возможна не более одной продажи и одного возврата;
    - Нужно учитывать все даты из обеих таблиц;
    - Результат отсортировать по product_id и date по возрастанию.
*/

SELECT COALESCE(table_sales.product_id, table_returns.product_id) AS product_id, table_sales.quantity AS sale_qty, table_returns.quantity AS return_qty, COALESCE(table_sales.date, table_returns.date) AS date
FROM table_sales
FULL OUTER JOIN table_returns ON table_sales.product_id = table_returns.product_id AND table_sales.date = table_returns.date
ORDER BY product_id, date;