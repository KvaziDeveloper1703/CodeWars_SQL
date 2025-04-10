/*
Write a query to process a table named "years" with a column "yr" representing a year. The query should return a new column named "century", which contains the century the year belongs to.

Examples:
1705 → 18
1900 → 19
1601 → 17

Напишите запрос для обработки таблицы "years" с колонкой "yr", представляющей год. Запрос должен вернуть новую колонку с именем "century", содержащую век, к которому относится год.

Примеры:
1705 → 18
1900 → 19
1601 → 17

https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097
*/

SELECT 
    yr,
    CEIL(yr / 100.0) AS century
FROM years;