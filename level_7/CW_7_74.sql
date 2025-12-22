/*
You are given a PostgreSQL film table from the DVD Rental database.

Write an SQL query that:
    - Selects film_id, title, and special_features;
    - Returns films that have either "Deleted Scenes" or "Behind the Scenes", but not both;
    - Excludes films that contain "Commentaries";
    - Orders results by title ASC, then film_id ASC;
    - special_features is a text[] array.

Дана таблица PostgreSQL film из базы DVD Rental.

Нужно написать SQL-запрос, который:
    - Выбирает film_id, title, special_features;
    - Возвращает фильмы с либо "Deleted Scenes", либо "Behind the Scenes", но не с обоими сразу;
    - Исключает фильмы с "Commentaries";
    - Сортирует результат по title по возрастанию, затем по film_id по возрастанию;
    - Поле special_features имеет тип text[].
*/

SELECT film_id, title, special_features
FROM film
WHERE NOT ('Commentaries' = ANY (special_features)) AND (('Deleted Scenes' = ANY (special_features)) <> ('Behind the Scenes' = ANY (special_features)))
ORDER BY title ASC, film_id ASC;