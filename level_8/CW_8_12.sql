/*
Write a query to process a table named "love" with columns "flower1" and "flower2", representing the number of petals on two flowers.

The query should return:
+ Columns "flower1" and "flower2" from the input table;
+ A new column named "res", which contains true if one flower has an even number of petals and the other has an odd number, and false otherwise.

Напишите запрос для обработки таблицы "love" с колонками "flower1" и "flower2", представляющими количество лепестков на двух цветах.

Запрос должен вернуть:
+ Колонки "flower1" и "flower2" из входной таблицы;
+ Новую колонку с именем res, которая содержит true, если у одного цветка чётное количество лепестков, а у другого нечётное, и false в противном случае.

https://www.codewars.com/kata/555086d53eac039a2a000083
*/

SELECT 
    flower1,
    flower2,
    CASE 
        WHEN (flower1 % 2 = 0 AND flower2 % 2 = 1) OR (flower1 % 2 = 1 AND flower2 % 2 = 0) THEN TRUE
        ELSE FALSE
    END AS res
FROM love;