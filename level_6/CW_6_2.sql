/*
You are working for a company that wants to reward its top 10 customers with a free gift.
You have been asked to create a report that returns the top 10 customers by total amount spent, ordered from highest to lowest.
The company also wants to know the total number of payments each customer made.

Your SQL query must output the following columns:
    - customer_id (int4)
    - email (varchar)
    - payments_count (int)
    - total_amount (float)

Requirements:
    - Return only the top 10 customers,
    - Order the results by total amount spent, from highest to lowest.

Ваша компания хочет наградить 10 лучших клиентов бесплатным подарком.
Вас попросили создать отчёт, который выводит топ-10 клиентов по сумме всех платежей, отсортированных от наибольшей суммы к наименьшей.
Также нужно вывести общее количество платежей, которое совершил каждый клиент.

Ваш SQL-запрос должен выводить следующие столбцы:
    - customer_id (int4)
    - email (varchar)
    - payments_count (int)
    - total_amount (float)

Требования:
    - Вернуть только 10 лучших клиентов,
    - Отсортировать по общей сумме платежей, от максимальной к минимальной.
*/

SELECT customer.customer_id, customer.email, COUNT(payment.payment_id) AS payments_count, CAST(SUM(payment.amount) AS float) AS total_amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.email
ORDER BY total_amount DESC
LIMIT 10;