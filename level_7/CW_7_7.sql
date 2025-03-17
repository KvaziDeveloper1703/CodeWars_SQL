/*
Find the total sum of internal angles (in degrees) in an n-sided simple polygon.
It is guaranteed that N will be greater than 2.

Найдите сумму всех внутренних углов (в градусах) n-угольного простого многоугольника.
Гарантируется, что n > 2.
*/

SELECT (n - 2) * 180 AS res
FROM angle;