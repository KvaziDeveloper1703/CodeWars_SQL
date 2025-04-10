/*
Write a query that returns the number of vowels in the column "str" from the table "getcount".
+ Input table: "getcount" with one column "str", containing strings with lowercase letters and/or spaces.
+ The output table should have two columns:
    + str — the original strings from the input table;
    + res — the number of vowels in the corresponding string.

Напишите запрос, который возвращает количество гласных в столбце "str" таблицы "getcount".
+ Входная таблица: "getcount" с одним столбцом "str", содержащим строки из строчных букв и/или пробелов.
+ Выходная таблица должна содержать два столбца:
    + str — исходные строки из входной таблицы;
    + res — количество гласных в соответствующей строке.

https://www.codewars.com/kata/54ff3102c1bad923760001f3
*/

SELECT 
    str,
    LENGTH(str) - LENGTH(REPLACE(str, 'a', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'e', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'i', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'o', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'u', '')) +
    LENGTH(str) - LENGTH(REPLACE(str, 'y', '')) AS res
FROM getcount;