/*
Write a parameterized SQL query (in a PREPARE statement) that takes one integer parameter $1 - the number of steps - and returns a single column pattern.

The output must alternate between rows of stars (*) and numbers, starting with one *.

Each next star row increases by one star, and each number row shows the count of stars from the previous row (as text).

Напиши параметризованный SQL-запрос (через PREPARE), принимающий один целочисленный параметр $1 - количество шагов - и возвращающий один столбец pattern.

Вывод должен чередовать строки из звёздочек (*) и чисел, начиная с одной *.

В каждой следующей строке со звёздами их количество увеличивается на 1, а строка с числом показывает количество звёзд из предыдущей строки (в текстовом виде).
*/

PREPARE alternate_star_and_number(int) AS
WITH RECURSIVE pattern_cte(step, pattern) AS (
    SELECT
        1,
        '*'::text
    UNION ALL
    SELECT
        step + 1,
        CASE
            WHEN step % 2 = 1
                THEN (step / 2 + 1)::text
            ELSE repeat('*', step / 2 + 1)
        END
    FROM pattern_cte
    WHERE step < $1
)
SELECT pattern
FROM pattern_cte;