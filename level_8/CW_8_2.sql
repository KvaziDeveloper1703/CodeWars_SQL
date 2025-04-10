/*
Reverse the string passed into your solution. You are given a table named "solution" with a column "str". Write an SQL statement to return a table with two columns: "str" and "res".

Переворачивайте строку, переданную в ваше решение. Вам дана таблица с именем "solution" и столбцом "str". Напишите SQL-запрос, чтобы вернуть таблицу с двумя столбцами: "str" и "res".

https://www.codewars.com/kata/5168bb5dfe9a00b126000018
*/

SELECT 
    str,
    REVERSE(str) AS res
FROM 
    solution;