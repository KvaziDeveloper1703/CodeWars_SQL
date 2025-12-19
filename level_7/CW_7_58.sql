/*
You are given two tables:
    - deals(deal_id, deal_name);
    - deal_login_fact(deal_id, account_id, occurred_at) - login timestamp.

Write a SQL query that returns only deals with at least one login and includes:
    - deal_id;
    - deal_name;
    - is_active - true if the last login was within the past 90 days, otherwise false;
    - last_login - time since last login in the format "X days and Y hours ago".

Order the result by deal_id descending.

Даны таблицы:
    - deals(deal_id, deal_name);
    - deal_login_fact(deal_id, account_id, occurred_at) - время входа.

Напишите SQL-запрос, который возвращает только сделки, по которым был хотя бы один вход, и выводит:
    - deal_id;
    - deal_name;
    - is_active - true, если последний вход был за последние 90 дней, иначе false;
    - last_login - время с последнего входа в формате «X days and Y hours ago».

Отсортировать результат по deal_id по убыванию.
*/

SELECT deals.deal_id, deals.deal_name, (MAX(deal_login_fact.occurred_at) >= NOW() - INTERVAL '90 days') AS is_active, (EXTRACT(DAY FROM NOW() - MAX(deal_login_fact.occurred_at))::int || ' days and ' || EXTRACT(HOUR FROM NOW() - MAX(deal_login_fact.occurred_at))::int || ' hours ago') AS last_login
FROM deals
JOIN deal_login_fact ON deals.deal_id = deal_login_fact.deal_id
GROUP BY deals.deal_id, deals.deal_name
ORDER BY deals.deal_id DESC;