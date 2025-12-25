/*
Given tables customers and certs, write a SQL query to list certificates expiring within the next 14 days.

Include all such certificates per customer, but exclude customers who have any other certificate expiring later than 14 days from today.

Output columns: name, ssn, cert_num, cert_start, cert_finish.

Order by name, then ssn, then cert_num (all ASC).

Даны таблицы customers и certs. Напиши SQL-запрос, который выводит сертификаты, истекающие в ближайшие 14 дней.

Включай все такие сертификаты клиента, но исключи клиентов, у которых есть хотя бы один сертификат с более поздней датой окончания.

Вывод: name, ssn, cert_num, cert_start, cert_finish.

Сортировка по name, затем ssn, затем cert_num (по возрастанию).
*/

SELECT customers.name, customers.ssn, certs.cert_num, certs.cert_start, certs.cert_finish
FROM customers
JOIN certs ON certs.ssn = customers.ssn
WHERE certs.cert_finish BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '14 days'
AND NOT EXISTS (
    SELECT 1
    FROM certs certs_later
    WHERE certs_later.ssn = customers.ssn AND certs_later.cert_finish > CURRENT_DATE + INTERVAL '14 days'
)
ORDER BY customers.name ASC, customers.ssn ASC, certs.cert_num ASC;