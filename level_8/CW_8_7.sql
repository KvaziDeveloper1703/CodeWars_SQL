/*
Write a query to process a table named "kata" with a column "n". Return the original column "n" and a new column "res" that contains the summation of all integers from 1 to n.

Example:
If n is 8, res should be 36 (since 1+2+3+4+5+6+7+8=36)

Напишите запрос для обработки таблицы "kata" с колонкой "n". Верните исходную колонку "n" и новую колонку "res", содержащую сумму всех чисел от 1 до n.

Пример:
Если n равно 8, то res должно быть 36 (так как 1+2+3+4+5+6+7+8=36)

https://www.codewars.com/kata/55d24f55d7dd296eb9000030
*/

SELECT 
    n,
    (n * (n + 1)) / 2 AS res
FROM kata;