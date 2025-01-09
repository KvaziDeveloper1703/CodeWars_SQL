/*
Write an SQL query to process a table named person with a column name. The query should return a new column named greeting, which contains the following string for each name:
"Hello, <name> how are you doing today?"

Make sure the output matches the exact format specified.

Напишите SQL-запрос для обработки таблицы person с колонкой name. Запрос должен вернуть новую колонку с именем greeting, которая содержит следующую строку для каждого name:
"Hello, <name> how are you doing today?"

Убедитесь, что вывод точно соответствует указанному формату.

https://www.codewars.com/kata/55a70521798b14d4750000a4
*/

SELECT 
    CONCAT('Hello, ', name, ' how are you doing today?') AS greeting
FROM person;