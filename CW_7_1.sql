/*
Write an SQL query that returns the number of vowels in the column str from the table getcount.

For this task, vowels are considered to be a, e, i, o, and u (but not y).

Requirements:
+ Input table: getcount with one column str, containing strings with lowercase letters and/or spaces.
+ The output table should have two columns:
    + str — the original strings from the input table.
    + res — the number of vowels in the corresponding string.

Напишите SQL-запрос, который возвращает количество гласных в столбце str таблицы getcount.

Для этой задачи считаются гласными только буквы a, e, i, o, u (буква y не включается).

Требования:
+ Входная таблица: getcount с одним столбцом str, содержащим строки из строчных букв и/или пробелов.
+ Выходная таблица должна содержать два столбца:
    + str — исходные строки из входной таблицы.
    + res — количество гласных в соответствующей строке.

https://www.codewars.com/kata/54ff3102c1bad923760001f3
*/

SELECT 
    str,
    LENGTH(str) - LENGTH(REPLACE(str, 'a', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'e', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'i', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'o', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'u', '')) AS res
FROM getcount;
