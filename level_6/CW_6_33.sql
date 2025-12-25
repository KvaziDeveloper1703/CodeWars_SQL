/*
You work with a legacy PostgreSQL 8.3 database.

Given a sales table, write a SQL query to return for each row:
    - total: total sum of cnt over all rows;
    - running_total: cumulative sum of cnt per customer_id (by customer_id);
    - running_total_unique: cumulative sum of cnt across all customers, ordered by customer_id, sales_id.

Output columns: sales_id, customer_id, cnt, total, running_total, running_total_unique.
Order results by customer_id ASC, then sales_id ASC.

Ты работаешь с устаревшей БД PostgreSQL 8.3.

По таблице sales напиши SQL-запрос, который для каждой строки вернёт:
    - total: общую сумму cnt по всем записям;
    - running_total: накопительную сумму cnt по каждому customer_id;
    - running_total_unique: общую накопительную сумму cnt по всем клиентам, упорядоченную по customer_id, sales_id.

Выводимые столбцы: sales_id, customer_id, cnt, total, running_total, running_total_unique.
Сортировка: customer_id ASC, затем sales_id ASC.
*/

SELECT sales_current.sales_id, sales_current.customer_id, sales_current.cnt,
    (SELECT SUM(sales_all.cnt)
     FROM sales sales_all) AS total,
    (SELECT SUM(sales_customer.cnt)
     FROM sales sales_customer
     WHERE sales_customer.customer_id <= sales_current.customer_id) AS running_total,
    (SELECT SUM(sales_ordered.cnt)
     FROM sales sales_ordered
     WHERE sales_ordered.customer_id < sales_current.customer_id OR (sales_ordered.customer_id = sales_current.customer_id AND sales_ordered.sales_id <= sales_current.sales_id)) AS running_total_unique
FROM sales sales_current
ORDER BY sales_current.customer_id ASC, sales_current.sales_id ASC;