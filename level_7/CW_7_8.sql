/*
Write a query to list the top 5 bestselling books (name, author, copies sold) from the "books" table.

Напишите запрос, который выведет 5 самых продаваемых книг (название, автор, количество проданных копий) из таблицы "books".

https://www.codewars.com/kata/591127cbe8b9fb05bd00004b
*/

SELECT name, author, copies_sold
FROM books
ORDER BY copies_sold DESC
LIMIT 5; 