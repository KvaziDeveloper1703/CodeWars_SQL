/*
Find the total sum of internal angles in an n-sided simple polygon.
It is guaranteed that N will be greater than 2.

Найдите сумму всех внутренних углов (в градусах) n-угольного простого многоугольника.
Гарантируется, что n > 2.

https://www.codewars.com/kata/5a03b3f6a1c9040084001765
*/

SELECT (n - 2) * 180 AS res
FROM angle;