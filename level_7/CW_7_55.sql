/*
You are given a table customer_purchases with columns customer_id, date, and product.

Write a SQL query that:
    - Counts the number of new unique customers per date;
    - A new customer is one who makes their first purchase on that date;
    - Returns columns date and num_new_customers;
    - Orders the result by date in ascending order.

Дана таблица customer_purchases с колонками customer_id, date и product.

Нужно написать SQL-запрос, который:
    - Считает количество новых уникальных клиентов за каждую дату;
    - Новый клиент - это клиент, совершивший первую покупку в эту дату;
    - Возвращает колонки date и num_new_customers;
    - Сортирует результат по date по возрастанию.
*/

SELECT date, COUNT(DISTINCT customer_id) AS num_new_customers
FROM (  SELECT customer_id, date, MIN(date) OVER (PARTITION BY customer_id) AS first_purchase_date
        FROM customer_purchases) t
WHERE date = first_purchase_date
GROUP BY date
ORDER BY date ASC;