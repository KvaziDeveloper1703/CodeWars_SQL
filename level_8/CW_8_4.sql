/*
Write a query to find the opposite of a given number. You are provided with a table named "opposite", which contains a column "number". Return a table with a single column "res", where each value is the opposite of the corresponding number.

Напишите запрос, чтобы найти противоположное переданного числа. Вам предоставлена таблица с именем "opposite", которая содержит столбец "number". Верните таблицу с одним столбцом "res", где каждое значение — это противоположное соответствующему числу из столбца "number".

https://www.codewars.com/kata/56dec885c54a926dcd001095
*/

SELECT 
    -number AS res
FROM 
    opposite;