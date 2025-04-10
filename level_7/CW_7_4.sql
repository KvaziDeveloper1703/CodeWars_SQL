/*
The task involves a triangle of consecutive odd numbers:
            1
         3     5
      7     9     11
   13    15    17    19
21    23    25    27    29

Write a query that calculates the sum of the numbers in the nth row of this triangle.
The table "nums" contains an integer column "n", representing the row number.
Return your result in a new column named "res".

Задача связана с треугольником последовательных нечётных чисел:
            1
         3     5
      7     9     11
   13    15    17    19
21    23    25    27    29

Напишите запрос, который вычисляет сумму чисел в n-й строке этого треугольника.
В таблице "nums" есть столбец "n", представляющий номер строки.
Верните результат в новом столбце с именем "res".

https://www.codewars.com/kata/55fd2d567d94ac3bc9000064
*/

SELECT 
    (n * n * n) AS res
FROM nums;