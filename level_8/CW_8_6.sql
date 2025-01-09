/*
Write an SQL query to process a table named repeatstr with the following columns:
+ n: the number of repetitions (integer).
+ s: the string to be repeated (string).

Your query should return all the columns from the table and add a new column named res, which contains the string s repeated exactly n times.

Напишите SQL-запрос для обработки таблицы repeatstr с колонками:
+ n: количество повторений (целое число).
+ s: строка для повторения (строка).

Запрос должен вернуть все столбцы из таблицы и добавить новый столбец с именем res, содержащий строку s, повторённую ровно n раз.

https://www.codewars.com/kata/57a0e5c372292dd76d000d7e
*/

SELECT
    s,
    n,
    REPEAT(s, n) AS res
FROM
    repeatstr;