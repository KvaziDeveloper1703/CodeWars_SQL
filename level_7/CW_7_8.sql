/*
Write an SQL query to list the top 5 bestselling books (name, author, copies sold) from the books table.

Напишите SQL-запрос, который выведет 5 самых продаваемых книг (название, автор, количество проданных копий) из таблицы books.
*/

SELECT name, author, copies_sold
FROM books
ORDER BY copies_sold DESC
LIMIT 5;