/*
Write an SQL query for a table named nospace with a column x. Return the original column x and a new column res where all spaces are removed from the strings in x.

Examples:
Input: "8 j 8 mBliB8g imjB8B8 jl B" → Output: "8j8mBliB8gimjB8B8jlB"
Input: "8 8 Bi fk8h B 8 BB8B B B B888 c hl8 BhB fd" → Output: "88Bifk8hB8BB8BBBB888chl8BhBfd"
Input: "8aaaaa dddd r " → Output: "8aaaaaddddr"

Напишите SQL-запрос для таблицы nospace с колонкой x. Верните исходную колонку x и новую колонку res, в которой удалены все пробелы из строк в x.

Примеры:
Ввод: "8 j 8 mBliB8g imjB8B8 jl B" → Вывод: "8j8mBliB8gimjB8B8jlB"
Ввод: "8 8 Bi fk8h B 8 BB8B B B B888 c hl8 BhB fd" → Вывод: "88Bifk8hB8BB8BBBB888chl8BhBfd"
Ввод: "8aaaaa dddd r " → Вывод: "8aaaaaddddr"

https://www.codewars.com/kata/57eae20f5500ad98e50002c5
*/

SELECT 
    x,
    REPLACE(x, ' ', '') AS res
FROM nospace;