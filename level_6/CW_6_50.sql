/*
You are given two tables: books and loans.

Tables:
Books:
    - book_id
    - title
    - author

Loans:
    - loan_id
    - book_id
    - borrower_name
    - return_date

Find the book loan(s) with the longest time interval between two consecutive borrows.

Rules:
    - The start of a loan equals the return_date of the previous loan for the same book;
    - If return_date is NULL, calculate the interval up to CURRENT_DATE;
    - If multiple loans share the same maximum interval, return all of them.

Output:
    - book_id
    - title
    - author
    - loan_id
    - borrower_name
    - longest_borrow_interval

Order by loan_id ascending when there is a tie.

Даны две таблицы: books и loans.
Таблицы:
Books:
    - book_id
    - title
    - author

Loans:
    - loan_id
    - book_id
    - borrower_name
    - return_date

Найдите выдачи книг с наибольшим интервалом между двумя последовательными заимствованиями.

Правила:
    - Начало выдачи равно return_date предыдущей выдачи той же книги;
    - Если return_date равно NULL, интервал считается до CURRENT_DATE;
    - Если максимальный интервал одинаковый, вернуть все такие записи.

Вывод:
    - book_id
    - title
    - author
    - loan_id
    - borrower_name
    - longest_borrow_interval

Сортировка по loan_id по возрастанию при равенстве интервалов.
*/

WITH loans_with_intervals AS (
    SELECT loans.loan_id, loans.book_id, loans.borrower_name, loans.return_date, LAG(loans.return_date) OVER (PARTITION BY loans.book_id ORDER BY loans.return_date) AS previous_return_date
    FROM loans
),
calculated_intervals AS (
    SELECT loan_id, book_id, borrower_name, (COALESCE(return_date, CURRENT_DATE) - previous_return_date) AS borrow_interval_days
    FROM loans_with_intervals
    WHERE previous_return_date IS NOT NULL
),
max_interval AS (
    SELECT MAX(borrow_interval_days) AS max_days
    FROM calculated_intervals
)
SELECT books.book_id, books.title, books.author, calculated_intervals.loan_id, calculated_intervals.borrower_name, calculated_intervals.borrow_interval_days || ' Days' AS longest_borrow_interval
FROM calculated_intervals
JOIN max_interval ON calculated_intervals.borrow_interval_days = max_interval.max_days
JOIN books ON books.book_id = calculated_intervals.book_id
ORDER BY calculated_intervals.loan_id ASC;