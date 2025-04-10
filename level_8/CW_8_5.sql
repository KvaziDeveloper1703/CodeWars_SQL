/*
Write a script that removes the first and last characters of a string. You are given a table named "removechar" with a column "s". Write an SQL query to return a table with two columns: "s" and "res". You don’t need to handle strings with less than two characters.

Напишите инструкцию, которая удаляет первый и последний символы строки. Вам дана таблица с именем "removechar" и столбцом "s". Напишите SQL-запрос, чтобы вернуть таблицу с двумя столбцами: "s" и "res". Вам не нужно обрабатывать строки длиной менее двух символов.

https://www.codewars.com/kata/56bc28ad5bdaeb48760009b0
*/

SELECT 
    s,
    SUBSTRING(s, 2, LENGTH(s) - 2) AS res
FROM 
    removechar
WHERE 
    LENGTH(s) >= 2;