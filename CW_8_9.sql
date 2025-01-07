/*
Write an SQL query to process a table named years with a column yr representing a year. The query should return a new column named century, which contains the century the year belongs to.

Century Definition:
+ The 1st century spans from year 1 to 100.
+ The 2nd century spans from year 101 to 200.
+ This pattern continues, where a century is determined by dividing the year by 100 and rounding up to the nearest integer.

Examples:
1705 → 18
1900 → 19
1601 → 17

Напишите SQL-запрос для обработки таблицы years с колонкой yr, представляющей год. Запрос должен вернуть новую колонку с именем century, содержащую век, к которому относится год.

Определение века:
+ 1-й век охватывает годы с 1 по 100.
+ 2-й век охватывает годы с 101 по 200.
+ Этот принцип продолжается: век определяется делением года на 100 с округлением вверх до ближайшего целого числа.

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