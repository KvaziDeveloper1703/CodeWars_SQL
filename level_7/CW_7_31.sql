/*
You are given two database tables: people and people_opinions.

Table: People
    - person_id (INT, primary key): A unique identifier for each person;
    - name (VARCHAR): The person’s name.

Table: People_opinions
    - opinion_giver_id (INT, foreign key → people.person_id): The person who gives the opinion;
    - person_id (INT, foreign key → people.person_id): The person the opinion is about;
    - current_opinion (VARCHAR, nullable): The current opinion of the giver about the person;
    - previous_opinion (VARCHAR, nullable): The previous opinion of the giver about the person.

Write an SQL query that:
    - Retrieves the name of the opinion giver and the name of the opinion receiver;
    - Includes both the current opinion and the previous opinion;
    - Returns only those records where the current opinion is different from the previous opinion, taking into account that either value may be NULL.

Sorts the results:
    - By the opinion giver’s name (ascending);
    - By the opinion receiver’s name (ascending).

Даны две таблицы базы данных: people и people_opinions.

Таблица: People
    - person_id (INT, первичный ключ): уникальный идентификатор человека;
    - name (VARCHAR): имя человека.

Таблица: People_opinions
    - opinion_giver_id (INT, внешний ключ → people.person_id): человек, который высказывает мнение;
    - person_id (INT, внешний ключ → people.person_id): человек, о котором высказывается мнение;
    - current_opinion (VARCHAR, допускает NULL): текущее мнение;
    - previous_opinion (VARCHAR, допускает NULL): предыдущее мнение.

Необходимо написать SQL-запрос, который:
    - Выводит имя человека, дающего мнение, и имя человека, о котором это мнение;
    - Показывает текущее и предыдущее мнение;
    - Включает только те записи, где текущее мнение отличается от предыдущего, учитывая, что одно или оба значения могут быть NULL.

Сортирует результат:
    - По имени автора мнения (по возрастанию);
    - По имени получателя мнения (по возрастанию).
*/

SELECT
    opinion_giver_person.name AS opinion_giver,
    opinion_receiver_person.name AS opinion_receiver,
    people_opinions.current_opinion,
    people_opinions.previous_opinion
FROM people_opinions
JOIN people AS opinion_giver_person
    ON people_opinions.opinion_giver_id = opinion_giver_person.person_id
JOIN people AS opinion_receiver_person
    ON people_opinions.person_id = opinion_receiver_person.person_id
WHERE
    (
        people_opinions.current_opinion <> people_opinions.previous_opinion
        OR (people_opinions.current_opinion IS NULL AND people_opinions.previous_opinion IS NOT NULL)
        OR (people_opinions.current_opinion IS NOT NULL AND people_opinions.previous_opinion IS NULL)
    )
ORDER BY opinion_giver_person.name ASC, opinion_receiver_person.name ASC;