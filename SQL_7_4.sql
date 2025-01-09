/*
The task involves a triangle of consecutive odd numbers:
             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29

Write an SQL query that calculates the sum of the numbers in the nth row of this triangle (starting at index 1). For example:

Input: n = 1 --> Output: 1
Input: n = 2 --> Output: 3 + 5 = 8

The table nums contains an integer column n, representing the row number.
Return your result in a new column named res.

Задача связана с треугольником последовательных нечётных чисел:

             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29

Напишите SQL-запрос, который вычисляет сумму чисел в n-й строке этого треугольника (нумерация начинается с 1). Например:

Ввод: n = 1 --> Вывод: 1
Ввод: n = 2 --> Вывод: 3 + 5 = 8

В таблице nums есть столбец n, представляющий номер строки.
Верните результат в новом столбце с именем res.

https://www.codewars.com/kata/55fd2d567d94ac3bc9000064
*/

SELECT 
    (n * n * n) AS res
FROM nums;