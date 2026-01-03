/*
You have a PostgreSQL table users with columns id, name, and birthdate.

Write a SQL query that returns all users, sorted by id in ascending order, and adds a column generation that classifies each user based on their birth year.

Generation rules:
    - Generation Z: 1997–2012;
    - Millennials: 1981–1996;
    - Generation X: 1965–1980;
    - Baby Boomers: 1946–1964;
    - Silent Generation: 1928–1945;
    - Greatest Generation: 1927 or earlier.

You must not use CASE WHEN in the query.

Есть таблица PostgreSQL users с полями id, name, birthdate.

Написать SQL-запрос, который возвращает всех пользователей, отсортированных по id по возрастанию, и добавляет поле generation, определяющее поколение по году рождения.

Границы поколений:
    - Generation Z: 1997–2012;
    - Millennials: 1981–1996;
    - Generation X: 1965–1980;
    - Baby Boomers: 1946–1964;
    - Silent Generation: 1928–1945;
    - Greatest Generation: 1927 и ранее.

Использовать оператор CASE WHEN запрещено.
*/

SELECT users.id, users.name, users.birthdate, generations.generation_name AS generation
FROM users
JOIN (
    VALUES
        (DATE '0001-01-01', DATE '1927-12-31', 'Greatest Generation'),
        (DATE '1928-01-01', DATE '1945-12-31', 'Silent Generation'),
        (DATE '1946-01-01', DATE '1964-12-31', 'Baby Boomers'),
        (DATE '1965-01-01', DATE '1980-12-31', 'Generation X'),
        (DATE '1981-01-01', DATE '1996-12-31', 'Millennials'),
        (DATE '1997-01-01', DATE '2012-12-31', 'Generation Z')
) AS generations(start_birthdate, end_birthdate, generation_name)
ON users.birthdate BETWEEN generations.start_birthdate AND generations.end_birthdate
ORDER BY users.id ASC;