/*
Write a query to process a table named "cycling" with columns "id" and "hours". The query should calculate the number of liters of water a cyclist will drink during cycling, using the formula: liters = FLOOR(hours * 0.5)

Return a result with three columns:
+ id - the identifier from the input table;
+ hours - the time in hours from the input table;
+ liters - the calculated number of liters, rounded down to the nearest whole number.

Напишите запрос для обработки таблицы "cycling" с колонками "id" и "hours". Запрос должен вычислить количество литров воды, которое выпьет велосипедист во время поездки, используя формулу: liters = FLOOR(hours * 0.5)

Верните результат с тремя колонками:
+ id - идентификатор из входной таблицы;
+ hours - время в часах из входной таблицы;
+ liters - рассчитанное количество литров, округлённое вниз до ближайшего целого числа.

https://www.codewars.com/kata/582cb0224e56e068d800003c
*/

SELECT 
    id,
    hours,
    FLOOR(hours * 0.5) AS liters
FROM cycling;