/*
Complete the solution by reversing the string passed into it. You are given a table named solution with a column str. Write an SQL statement to return a table with two columns: str (the original string) and res (the reversed string).

Examples:
'world' => 'dlrow'
'word' => 'drow'

Дополните решение, чтобы оно переворачивало строку, переданную в него. Вам дана таблица с именем solution и столбцом str. Напишите SQL-запрос, чтобы вернуть таблицу с двумя столбцами: str (исходная строка) и res (перевернутая строка).

Примеры:
'world' => 'dlrow'
'word' => 'drow'

https://www.codewars.com/kata/5168bb5dfe9a00b126000018
*/

SELECT 
    str,
    REVERSE(str) AS res
FROM 
    solution;