/*
Write an SQL query to process a table named cycling with columns id and hours. The query should calculate the number of liters of water Nathan will drink during cycling, using the formula: liters = FLOOR(hours * 0.5)

Return a result with three columns:
+ id: the identifier from the input table.
+ hours: the time in hours from the input table.
+ liters: the calculated number of liters, rounded down to the nearest whole number.

Examples:
For hours = 3, liters = 1
For hours = 6.7, liters = 3
For hours = 11.8, liters = 5

Напишите SQL-запрос для обработки таблицы cycling с колонками id и hours. Запрос должен вычислить количество литров воды, которое выпьет Натан во время поездки, используя формулу: liters = FLOOR(hours * 0.5)

Верните результат с тремя колонками:
+ id: идентификатор из входной таблицы.
+ hours: время в часах из входной таблицы.
+ liters: рассчитанное количество литров, округлённое вниз до ближайшего целого числа.

Примеры:
Если hours = 3, то liters = 1
Если hours = 6.7, то liters = 3
Если hours = 11.8, то liters = 5

https://www.codewars.com/kata/582cb0224e56e068d800003c
*/

SELECT 
    id,
    hours,
    FLOOR(hours * 0.5) AS liters
FROM cycling;