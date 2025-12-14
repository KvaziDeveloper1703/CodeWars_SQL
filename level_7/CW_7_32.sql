/*
You are given a PostgreSQL database containing information about users and a list of known public email domains.

Table: Users
    - id (INT, primary key): Unique identifier of a user;
    - email (VARCHAR, unique): User’s email address in the format localpart@domain.com.

Table: Public_domains
    - domain (VARCHAR, primary key): A known public email domain (for example, gmail.com, yahoo.com, hotmail.com).

Definitions:
A public email domain is a widely used, publicly accessible email service listed in the public_domains table.
Email addresses are guaranteed to be in a simple format with exactly one @ symbol. More complex email formats are not considered.

Write an SQL query that:
    - Extracts the domain part from user email addresses;
    - Keeps only those email addresses whose domain appears in the public_domains table;
    - Aggregates the data to count how many users use each public email domain;
    - Sorts the results:
        - By the number of users per domain in descending order;
        - By the domain name in ascending alphabetical order in case of equal counts.

Вам предоставлена база данных PostgreSQL, содержащая информацию о пользователях и список известных публичных почтовых доменов.

Таблица: Users
    - id (INT, первичный ключ): уникальный идентификатор пользователя;
    - email (VARCHAR, уникальное значение): электронная почта пользователя в формате localpart@domain.com.

Таблица: Public_domains
    - domain (VARCHAR, первичный ключ): известный публичный почтовый домен (например, gmail.com, yahoo.com, hotmail.com).

Определения:
Публичный почтовый домен - это широко используемый и общедоступный почтовый сервис, перечисленный в таблице public_domains.
Гарантируется, что адреса электронной почты имеют простой формат с ровно одним символом @. Сложные форматы адресов не рассматриваются.

Необходимо написать SQL-запрос, который:
    - Извлекает доменную часть из адресов электронной почты пользователей;
    - Оставляет только адреса с доменами, присутствующими в таблице public_domains;
    - Группирует данные и подсчитывает количество пользователей для каждого публичного домена;
    - Сортирует результат:
        - По количеству пользователей по убыванию;
        - По названию домена в алфавитном порядке по возрастанию при равенстве количества.
*/

SELECT public_domains.domain AS domain, COUNT(users.id) AS user_count
FROM users
JOIN public_domains ON SPLIT_PART(users.email, '@', 2) = public_domains.domain
GROUP BY public_domains.domain
ORDER BY user_count DESC, public_domains.domain ASC;