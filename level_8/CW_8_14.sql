/*
Write a query to calculate the total number of blank pages required for your classmates paperwork. The table "paperwork" contains the following columns:
+ id: Unique identifier for each record;
+ n: Number of classmates;
+ m: Number of pages in the paperwork.

The result should be a new table with columns:
+ n - Number of classmates;
+ m - Number of pages;
+ res - The total number of blank pages required.

Examples:
n = 5, m = 5 --> res = 25

Напишите запрос для вычисления общего количества чистых страниц, необходимых для выполнения работы для одноклассников. Таблица "paperwork" содержит следующие столбцы:
+ id - Уникальный идентификатор для каждой записи;
+ n - Количество одноклассников;
+ m - Количество страниц в работе.

Результат должен быть представлен в новой таблице со столбцами:
+ n - Количество одноклассников;
+ m - Количество страниц;
+ res - Общее количество чистых страниц.

Пример:
n = 5, m = 5 --> res = 25

https://www.codewars.com/kata/55f9b48403f6b87a7c0000bd
*/

SELECT 
    n,
    m,
    CASE 
        WHEN n < 0 OR m < 0 THEN 0
        ELSE n * m
    END AS res
FROM paperwork;