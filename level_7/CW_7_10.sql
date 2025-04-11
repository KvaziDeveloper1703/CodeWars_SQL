/*
Треугольные числа называются так, потому что при расположении в виде точек они образуют равносторонний треугольник. 

Например:
1   2   3
*   **  ***
    *   **
        *

Triangular numbers are named because they form an equilateral triangular shape when laid out as dots. 

For example:
1   2   3
*   **  ***
    *   **
        *

https://www.codewars.com/kata/525e5a1cb735154b320002c8
*/

SELECT n, 
       CASE 
           WHEN n > 0 THEN (n * (n + 1)) / 2
           ELSE 0
       END AS res
FROM triangular;