/*
You are given a PostgreSQL table ip_addresses with columns id and ip.

Write a SQL query that:
    - Removes leading zeros from each octet of the IP address;
    - Returns id and the cleaned IP as cleaned_ip;
    - Keeps 0 if an octet consists only of zeros;
    - Orders the result by id in descending order.

Дана таблица PostgreSQL ip_addresses с колонками id и ip.

Нужно написать SQL-запрос, который:
    - Убирает ведущие нули в каждом октете IP-адреса;
    - Возвращает id и очищенный IP в колонке cleaned_ip;
    - Преобразует октет из одних нулей в 0;
    - Сортирует результат по id по убыванию.
*/

SELECT
    id,
    CONCAT_WS(
        '.',
        COALESCE(NULLIF(REGEXP_REPLACE(split_part(ip, '.', 1), '^0+', ''), ''), '0'),
        COALESCE(NULLIF(REGEXP_REPLACE(split_part(ip, '.', 2), '^0+', ''), ''), '0'),
        COALESCE(NULLIF(REGEXP_REPLACE(split_part(ip, '.', 3), '^0+', ''), ''), '0'),
        COALESCE(NULLIF(REGEXP_REPLACE(split_part(ip, '.', 4), '^0+', ''), ''), '0')
    ) AS cleaned_ip
FROM ip_addresses
ORDER BY id DESC;