/*
You are given a table well_log with depth-ordered measurements.

Task:
    - Consider every interval of exactly 5 consecutive rows;
    - For each interval, calculate the sum of ktim.

For each interval return:
    - start_depth - depth of the first row;
    - end_depth - depth of the fifth row;
    - total_ktim - sum of ktim, rounded to 2 decimals.

Rules:
    - All possible 5-row intervals must be included;
    - Sort by total_ktim DESC;
    - If sums are equal, sort by start_depth ASC;
    - The table always has more than 5 rows.

Дана таблица well_log с измерениями, упорядоченными по глубине.

Задача:
    - Рассмотреть все интервалы из ровно 5 соседних строк;
    - Для каждого интервала вычислить сумму ktim.

Для каждого интервала вывести:
    - start_depth - глубина первой строки;
    - end_depth - глубина пятой строк;
    - total_ktim - сумма ktim, округлённая до 2 знаков.

Правила:
    - Нужно вернуть все возможные интервалы из 5 строк;
    - Сортировка по total_ktim по убыванию;
    - При равных значениях - по start_depth по возрастанию;
    - В таблице всегда больше 5 строк.
*/

SELECT start_depth, end_depth, TO_CHAR(total_ktim_num, 'FM999999999.00') AS total_ktim
FROM (
    SELECT
        depth AS start_depth,
        LEAD(depth, 4) OVER (ORDER BY depth) AS end_depth,
        SUM(ktim) OVER (
            ORDER BY depth
            ROWS BETWEEN CURRENT ROW AND 4 FOLLOWING
        ) AS total_ktim_num
    FROM well_log
) t
WHERE end_depth IS NOT NULL
ORDER BY total_ktim_num DESC, start_depth ASC;