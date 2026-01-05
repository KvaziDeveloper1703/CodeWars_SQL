/*
You are given a table transactions(id, date, amount).

Write an SQL query that:
    - Orders transactions by date;
    - Calculates a cumulative sum of amount from the first transaction;
    - Returns rows up to and including the first transaction where the cumulative total reaches or exceeds 15;
    - Adds a column days_to_reach_threshold;
    - Shows days_to_reach_threshold only in the last row, equal to the number of days between the first transaction date and the date when the threshold is reached;
    - Sorts the final result by id ascending.

Дана таблица transactions(id, date, amount).

Нужно написать SQL-запрос, который:
    - Упорядочивает транзакции по дате;
    - Считает накопительную сумму amount, начиная с первой транзакции;
    - Возвращает строки до первой транзакции, где сумма достигает или превышает 15;
    - Добавляет столбец days_to_reach_threshold;
    - Заполняет days_to_reach_threshold только в последней строке - количеством дней между первой транзакцией и датой достижения порога;
    - Итоговый результат сортирует по id по возрастанию.
*/

WITH ordered_transactions AS (
    SELECT id, date, amount, SUM(amount) OVER (ORDER BY date) AS cumulative_amount, MIN(date) OVER () AS first_date
    FROM transactions
),
threshold_reached AS (
    SELECT id, date, amount, cumulative_amount, first_date, MIN(date) FILTER (WHERE cumulative_amount >= 15) OVER () AS threshold_date
    FROM ordered_transactions
)
SELECT id, date, amount,
    CASE
        WHEN date = threshold_date
        THEN date - first_date
        ELSE NULL
    END AS days_to_reach_threshold
FROM threshold_reached
WHERE date <= threshold_date
ORDER BY id;