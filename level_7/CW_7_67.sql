/*
You have a table sample_table(a, b).

Write a PostgreSQL query that always returns exactly 10 rows.

Rules:
    - If the table has ≥ 10 rows → return the first 10 rows;
    - If the table has < 10 rows → add extra rows with a = 0 and b = '-' until there are 10 rows;
    - Rows from the table come first, extra rows after;
    - Original rows must be sorted by a in ascending order.

Дана таблица sample_table(a, b).

Нужно написать запрос PostgreSQL, который всегда возвращает ровно 10 строк.

Правила:
    - Если строк ≥ 10 → вернуть первые 10;
    - Если строк < 10 → добавить строки с a = 0, b = '-' до 10 строк;
    - Сначала строки из таблицы, затем добавленные;
    - Строки из таблицы отсортировать по a по возрастанию.
*/

WITH ordered_rows AS (
    SELECT a, b
    FROM sample_table
    ORDER BY a
    LIMIT 10
),

filled_rows AS (
    SELECT a, b, 0 AS priority
    FROM ordered_rows

    UNION ALL

    SELECT 0 AS a, '-' AS b, 1 AS priority
    FROM generate_series(1, 10 - (SELECT COUNT(*) FROM ordered_rows)))

SELECT a, b
FROM filled_rows
ORDER BY priority, a
LIMIT 10;