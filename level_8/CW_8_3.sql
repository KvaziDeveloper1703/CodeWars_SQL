/*
Write a script that takes a boolean value and returns a string: "Yes" for true or "No" for false. You are given a table named "booltoword" with a column "bool". Write an SQL statement to return a table with two columns: "bool" and "res".

Напишите инструкцию, которая принимает булево значение и возвращает строку: "Yes" для true или "No" для false. Вам дана таблица с именем "booltoword" и столбцом "bool". Напишите SQL-запрос, чтобы вернуть таблицу с двумя столбцами: "bool" и "res".

https://www.codewars.com/kata/53369039d7ab3ac506000467
*/

SELECT 
    bool, 
    CASE 
        WHEN bool = TRUE THEN 'Yes'
        WHEN bool = FALSE THEN 'No'
    END AS res
FROM 
    booltoword;