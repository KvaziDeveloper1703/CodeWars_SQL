/*
You have a table state_streams(state, total_streams).

Write an SQL query that returns pairs of states where the difference in total_streams is less than 1000.

Output columns:
    - state_a;
    - state_b;
    - difference.

Rules:
    - Each pair appears only once;
    - state_a < state_b alphabetically;
    - Result sorted by state_a, then state_b.

Дана таблица state_streams(state, total_streams).

Нужно написать SQL-запрос, который возвращает пары штатов, у которых разница total_streams меньше 1000.

Столбцы результата:
    - state_a;
    - state_b;
    - difference.

Правила:
    - Каждая пара выводится один раз;
    - state_a и state_b отсортированы по алфавиту;
    - Результат отсортирован по state_a, затем state_b.
*/

SELECT streams_left.state  AS state_a, streams_right.state AS state_b, ABS(streams_left.total_streams - streams_right.total_streams) AS difference
FROM state_streams AS streams_left
JOIN state_streams AS streams_right ON streams_left.state < streams_right.state
WHERE ABS(streams_left.total_streams - streams_right.total_streams) < 1000
ORDER BY state_a, state_b;