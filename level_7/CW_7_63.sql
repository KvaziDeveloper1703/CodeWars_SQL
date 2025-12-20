/*
You have two tables: books(book_id, title, author) and loans(loan_id, book_id, borrower_name, return_date).

Write a SQL query that:
    - Finds books that have been loaned at least once;
    - Includes only books where all loans have a non-NULL return_date;
    - Returns book_id and title;
    - Orders the result by book_id in descending order.

Есть две таблицы: books(book_id, title, author) и loans(loan_id, book_id, borrower_name, return_date).

Нужно написать SQL-запрос, который:
    - Находит книги, которые брали в аренду хотя бы один раз;
    - Оставляет только книги, у которых все записи выдачи имеют заполненный return_date;
    - Выводит book_id и title;
    - Сортирует результат по book_id по убыванию.
*/

SELECT books.book_id, books.title
FROM books
JOIN loans ON loans.book_id = books.book_id
GROUP BY books.book_id, books.title
HAVING COUNT(*) > 0 AND COUNT(loans.return_date) = COUNT(*)
ORDER BY books.book_id DESC;