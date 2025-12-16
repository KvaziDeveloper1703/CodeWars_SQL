/*
Write a SQL query for the table books (id, title, author, genres[]) that:
    - Returns each genre;
    - Counts how many books belong to each genre;
    - Returns an array of book titles per genre, sorted alphabetically.

Order the result by book count descending, and by genre name ascending when counts are equal.

Напиши SQL-запрос для таблицы books (id, title, author, genres[]), который:
    - Выводит каждый жанр;
    - Считает количество книг в каждом жанре;
    - Возвращает массив названий книг по жанру, отсортированный по алфавиту.

Отсортируй результат по количеству книг по убыванию, а при равенстве - по названию жанра по возрастанию.
*/

SELECT genre, COUNT(*) AS count, ARRAY_AGG(title ORDER BY title) AS books
FROM (  SELECT title, UNNEST(genres) AS genre
        FROM books) AS expanded_books
GROUP BY genre
ORDER BY count DESC, genre ASC;