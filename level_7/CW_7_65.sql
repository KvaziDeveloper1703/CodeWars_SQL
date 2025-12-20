/*
You have two tables: transaction(transaction_id, date) and transaction_content(transaction_id, product_code, supplier, quantity).

Write a SQL query that:
    - Returns transaction_id, date, and supplier for each transaction;
    - Shows the supplier name if all items in a transaction are from the same supplier;
    - Shows 'Several' if a transaction contains items from more than one supplier;
    - Orders the result by transaction_id in ascending order.

Есть две таблицы: transaction(transaction_id, date) и transaction_content(transaction_id, product_code, supplier, quantity).

Нужно написать SQL-запрос, который:
    - Выводит transaction_id, date и supplier для каждой транзакции;
    - Показывает название поставщика, если все товары в транзакции от одного поставщика;
    - Показывает 'Several', если в транзакции несколько поставщиков;
    - Сортирует результат по transaction_id по возрастанию.
*/

SELECT transaction.transaction_id, transaction.date,
    CASE
        WHEN COUNT(DISTINCT transaction_content.supplier) = 1
        THEN MAX(transaction_content.supplier)
        ELSE 'Several'
    END AS supplier
FROM transaction
JOIN transaction_content ON transaction_content.transaction_id = transaction.transaction_id
GROUP BY transaction.transaction_id, transaction.date
ORDER BY transaction.transaction_id ASC;