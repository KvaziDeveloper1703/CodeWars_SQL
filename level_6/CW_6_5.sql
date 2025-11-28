/*
Using the payment table, create a monthly report comparing payments processed by Mike (staff_id = 1) and Jon (staff_id = 2).

For each month (1–12), show:
    - total number of payments;
    - total payment amount;
    - number and amount of Mike’s payments;
    - number and amount of Jon’s payments.

Months should be ordered naturally. The dataset contains only one year.

Используя таблицу payment, нужно создать помесячный отчёт, сравнивающий платежи Майка (staff_id = 1) и Джона (staff_id = 2).

Для каждого месяца вывести:
    - общее число платежей;
    - общую сумму;
    - число и сумму платежей Майка;
    - число и сумму платежей Джона.

Месяцы идут в естественном порядке, данные только за один год.
*/

SELECT  EXTRACT(MONTH FROM payment_date) AS month,
        COUNT(*) AS total_count,
        SUM(amount) AS total_amount,
        COUNT(*) FILTER (WHERE staff_id = 1) AS mike_count,
        SUM(amount) FILTER (WHERE staff_id = 1) AS mike_amount,
        COUNT(*) FILTER (WHERE staff_id = 2) AS jon_count,
        SUM(amount) FILTER (WHERE staff_id = 2) AS jon_amount
FROM payment
GROUP BY month
ORDER BY month;