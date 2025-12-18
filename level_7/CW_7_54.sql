/*
You are given a table data with one column num.

Write a SQL query that:
    - Finds the first missing number in an ascending sequence;
    - Assumes numbers should increase by 1;
    - Values in num are unique.

Дана таблица data с одной колонкой num.

Нужно написать SQL-запрос, который:
    - Находит первое пропущенное число в возрастающей последовательности;
    - Предполагает шаг последовательности равным 1;
    - Значения в колонке num уникальны.
*/

SELECT num + 1 AS missing_number
FROM (  SELECT num, LEAD(num) OVER (ORDER BY num) AS next_num
        FROM data) t
WHERE next_num IS NOT NULL AND next_num <> num + 1
ORDER BY num
LIMIT 1;