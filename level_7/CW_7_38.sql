/*
You are given a table client_parents that stores parent–child relationships.

Write an SQL query to calculate how many siblings each client has.

Definition:
    - Two clients are siblings if they share at least one parent;
    - Sibling relationship is not transitive;
    - Each client has exactly two parents;
    - No duplicate (client_id, parent_id) rows.

Output:
    - client_id
    - num_siblings

Requirements:
    - Do not count the client itself;
    - Count each sibling once, even if they share two parents;
    - Sort results by client_id in ascending order.

Дана таблица client_parents, описывающая связи родитель–ребёнок.

Нужно написать SQL-запрос, который определяет количество братьев/сестёр у каждого клиента.

Определение:
    - Клиенты считаются siblings, если они имеют хотя бы одного общего родителя;
    - Связь не транзитивна;
    - У каждого клиента ровно два родителя;
    - Дубликатов (client_id, parent_id) нет.

Результат:
    - client_id
    - num_siblings

Требования:
    - Не учитывать самого клиента;
    - Один sibling считается один раз, даже если общих родителей два;
    - Отсортировать по client_id по возрастанию.
*/

SELECT all_clients.client_id, COUNT(DISTINCT sibling_clients.client_id) AS num_siblings
FROM (  SELECT DISTINCT client_id
        FROM client_parents) AS all_clients
LEFT JOIN client_parents AS client_parent_links ON client_parent_links.client_id = all_clients.client_id
LEFT JOIN client_parents AS potential_sibling_parent_links ON client_parent_links.parent_id = potential_sibling_parent_links.parent_id AND potential_sibling_parent_links.client_id <> client_parent_links.client_id
LEFT JOIN ( SELECT DISTINCT client_id
            FROM client_parents) AS sibling_clients ON sibling_clients.client_id = potential_sibling_parent_links.client_id
GROUP BY all_clients.client_id
ORDER BY all_clients.client_id ASC;