/*
You are working with a table that stores fuel transactions. Some transactions are incorrect and later reversed.

A reversal transaction:
    - Has is_reversal = 'Y';
    - Contains a negative quantity equal to the original one;
    - Occurs after the original transaction;
    - Has the same fuel_type.

Each reversal is paired with the closest previous matching transaction (same fuel type and quantity). If multiple candidates exist, the most recent one before the reversal is chosen.

Table: fuel_transactions
    - transaction_id - unique transaction ID;
    - transaction_datetime - transaction timestamp;
    - quantity - fuel quantity;
    - fuel_type - fuel type;
    - is_reversal - 'Y' or 'N'.

Write a SQL query that:
    - Identifies valid reversal pairs;
    - Removes both transactions from each pair;
    - Returns all remaining transactions;
    - Outputs all columns;
    - Orders the result by transaction_datetime ascending.

Дана таблица с топливными транзакциями. Некоторые транзакции ошибочны и позже аннулируются.

Аннулирующая транзакция:
    - имеет is_reversal = 'Y';
    - содержит отрицательное количество, равное исходному по модулю;
    - происходит позже исходной транзакции;
    - имеет тот же fuel_type.

Аннулирование связывается с ближайшей по времени предыдущей подходящей транзакцией (тот же тип топлива и количество).

Таблица: fuel_transactions
    - transaction_id - уникальный ID;
    - transaction_datetime - дата и время;
    - quantity - количество топлива;
    - fuel_type - тип топлива;
    - is_reversal - 'Y' или 'N'.

Написать SQL-запрос, который:
    - находит пары аннулирования;
    - исключает обе транзакции из каждой пары;
    - возвращает все остальные записи;
    - выводит все столбцы;
    - сортирует результат по transaction_datetime по возрастанию.
*/

WITH reversal_pairs AS (
    SELECT reversal.transaction_id AS reversal_id, original.transaction_id AS original_id
    FROM fuel_transactions AS reversal
    JOIN LATERAL (
        SELECT candidate.transaction_id
        FROM fuel_transactions AS candidate
        WHERE candidate.is_reversal = 'N'
          AND candidate.fuel_type = reversal.fuel_type
          AND candidate.quantity = -reversal.quantity
          AND candidate.transaction_datetime < reversal.transaction_datetime
        ORDER BY candidate.transaction_datetime DESC
        LIMIT 1
    ) AS original ON TRUE
    WHERE reversal.is_reversal = 'Y'
),
transactions_to_remove AS (
    SELECT original_id AS transaction_id FROM reversal_pairs
    UNION
    SELECT reversal_id AS transaction_id FROM reversal_pairs
)
SELECT transaction_id, transaction_datetime, quantity, fuel_type, is_reversal
FROM fuel_transactions
WHERE transaction_id NOT IN (
    SELECT transaction_id FROM transactions_to_remove
)
ORDER BY transaction_datetime;