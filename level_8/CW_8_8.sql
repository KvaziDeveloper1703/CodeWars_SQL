/*
Write a query for a table named "nospace" with a column "x". Return the original column "x" and a new column "res" where all spaces are removed from the strings in "x".

Example:
Input: "8 j 8 mBliB8g imjB8B8 jl B"
Output: "8j8mBliB8gimjB8B8jlB"

Напишите запрос для таблицы "nospace" с колонкой "x". Верните исходную колонку "x" и новую колонку "res", в которой удалены все пробелы из строк в "x".

Примеры:
Ввод: "8 j 8 mBliB8g imjB8B8 jl B"
Вывод: "8j8mBliB8gimjB8B8jlB"

https://www.codewars.com/kata/57eae20f5500ad98e50002c5
*/

SELECT 
    x,
    REPLACE(x, ' ', '') AS res
FROM nospace;