/*
You are given two tables: books and loans.

Tables:
Books:
    - book_id (integer) - unique book identifier;
    - title (string) - book title;
    - author (string) - book author.

Loans:
    - loan_id (integer) - unique loan identifier;
    - book_id (integer) - references books.book_id;
    - borrower_name (string) - name of the borrower;
    - return_date (date, nullable) - return date; NULL means the book is still borrowed.

Write an SQL query that finds the most frequently borrowed book(s) and the last person who borrowed each of them.
    - If multiple books share the maximum number of loans, return all tied books;
    - Results must be sorted by book_id in ascending order.

Definition of last borrower for each book:
    - If there is a loan with return_date IS NULL, the borrower_name from that row is the last borrower;
    - Otherwise, the borrower from the loan with the most recent return_date is the last borrower.

Output Columns:
    - book_id - book identifier;
    - title - book title;
    - last_borrower - name of the last borrower;
    - loan_count - total number of loans for the book.

Даны две таблицы: books и loans.
Таблицы:
Books:
    - book_id - уникальный идентификатор книги;
    - title - название книги;
    - author - автор.

Loans:
    - loan_id - уникальный идентификатор займа;
    - book_id - ссылка на books.book_id;
    - borrower_name - имя заёмщика;
    - return_date - дата возврата; NULL, если книга ещё не возвращена.

Напишите SQL-запрос, который определяет книгу (или книги), взятые в библиотеке наибольшее количество раз, а также последнего заёмщика для каждой из них.
    - Если несколько книг имеют одинаковое максимальное количество займов, вернуть все такие книги;
    - Результат отсортировать по book_id по возрастанию.

Определение последнего заёмщика для каждой книги:
    - Если существует запись с return_date IS NULL, то borrower_name из этой записи считается последним заёмщиком;
    - Если таких записей нет, выбирается заёмщик с самой поздней датой возврата.

Выходные данные:
    - book_id - идентификатор книги;
    - title - название книги;
    - last_borrower - последний заёмщик;
    - loan_count - общее количество займов книги.
*/

WITH ranked_loans AS (
    SELECT
        loans.book_id,
        loans.borrower_name,
        loans.return_date,
        COUNT(*) OVER (PARTITION BY loans.book_id) AS loan_count,
        ROW_NUMBER() OVER (
            PARTITION BY loans.book_id
            ORDER BY
                CASE
                    WHEN loans.return_date IS NULL THEN 0
                    ELSE 1
                END,
                loans.return_date DESC
        ) AS borrower_order
    FROM loans
),
book_loan_statistics AS (
    SELECT books.book_id, books.title, ranked_loans.borrower_name AS last_borrower, ranked_loans.loan_count
    FROM ranked_loans
    JOIN books ON books.book_id = ranked_loans.book_id
    WHERE ranked_loans.borrower_order = 1
),
maximum_loan_count AS (
    SELECT MAX(loan_count) AS max_loan_count
    FROM book_loan_statistics
)
SELECT book_loan_statistics.book_id, book_loan_statistics.title, book_loan_statistics.last_borrower, book_loan_statistics.loan_count
FROM book_loan_statistics
JOIN maximum_loan_count ON book_loan_statistics.loan_count = maximum_loan_count.max_loan_count
ORDER BY book_loan_statistics.book_id;