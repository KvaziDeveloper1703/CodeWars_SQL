/*
You are given a table atm_transactions with transaction durations stored as strings in the format hh.mm.

Write a PostgreSQL query to calculate total transaction time per ATM.

Requirements:
    - Convert hh.mm into minutes before summing;
    - Convert the total back to hh.mm format;
    - Minutes must always have two digits;
    - Output only:
        - atm_id;
        - total_duration_hours.

Sort by:
    - total_duration_hours DESC;
    - atm_id DESC.

Дана таблица atm_transactions, где длительность транзакции хранится в формате hh.mm.

Напишите PostgreSQL-запрос для подсчёта общего времени работы каждого банкомата.

Требования:
    - Перевести hh.mm в минуты и суммировать;
    - Результат вернуть в формате hh.mm;
    - Минуты всегда двухзначные;
    - Вывести только:
        - atm_id;
        - total_duration_hours.

Сортировка:
    - по убыванию общего времени;
    - по atm_id по убыванию при равенстве.
*/

SELECT atm_id, ((total_minutes / 60)::text || '.' || LPAD((total_minutes % 60)::text, 2, '0')) AS total_duration_hours
FROM (  SELECT atm_id, SUM(split_part(transaction_duration, '.', 1)::int * 60 + split_part(transaction_duration, '.', 2)::int) AS total_minutes
        FROM atm_transactions
        GROUP BY atm_id
) aggregated_durations
ORDER BY total_minutes DESC, atm_id DESC;