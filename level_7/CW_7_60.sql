/*
You are given a table stations with columns:
    - id;
    - city_name.

Refactor the given SQL query to return distinct city names that start with a vowel (A, E, I, O, U), without using UNION, and order the result by city_name in ascending order.

Дана таблица stations со столбцами:
    - id;
    - city_name.

Перепишите SQL-запрос так, чтобы получить уникальные названия городов, начинающиеся с гласной (A, E, I, O, U), без использования UNION, и отсортировать результат по city_name по возрастанию.
*/

SELECT DISTINCT city_name
FROM stations
WHERE city_name ~ '^[AEIOU]'
ORDER BY city_name ASC;