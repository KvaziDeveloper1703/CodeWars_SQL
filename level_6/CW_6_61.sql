/*
You are given a table order_status with orders and their status_code.

Write a SQL query that adds a column shipment_batch_number.

Rules:
    - Before the first row where status_code = 4, shipment_batch_number must be 0;
    - When status_code = 4 appears, the batch number starts at 1;
    - After that, the batch number increases by 1 for each next row;
    - Every time status_code = 4 appears again, the batch number restarts at 1;
    - Order the result by order_id ascending.

Дана таблица order_status с заказами и полем status_code.

Нужно написать SQL-запрос, который добавляет столбец shipment_batch_number.

Правила:
    - До первого появления status_code = 4 значение shipment_batch_number равно 0;
    - При появлении status_code = 4 нумерация начинается с 1;
    - Далее номер увеличивается на 1 для каждой следующей строки;
    - При каждом новом status_code = 4 нумерация снова начинается с 1;
    - Результат отсортировать по order_id по возрастанию.
*/

WITH base AS (
    SELECT order_id, product_name, status_code, SUM(CASE WHEN status_code = 4 THEN 1 ELSE 0 END) OVER (ORDER BY order_id) AS shipment_group
    FROM order_status
)
SELECT order_id, product_name, status_code,
    CASE
        WHEN shipment_group = 0 THEN 0
        ELSE ROW_NUMBER() OVER (
            PARTITION BY shipment_group
            ORDER BY order_id
        )
    END AS shipment_batch_number
FROM base
ORDER BY order_id;