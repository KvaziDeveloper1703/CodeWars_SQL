/*
Given a divisor and a bound, find the largest integer N such that:
+ N is divisible by divisor;
+ N is less than or equal to bound;
+ N is greater than 0.

Даны делитель и граница. Найдите наибольшее целое число N, которое удовлетворяет следующим условиям:
+ N делится на делитель без остатка;
+ N меньше или равно границе;
+ N больше 0.

https://www.codewars.com/kata/5aba780a6a176b029800041c
*/

SELECT (bound / divisor) * divisor AS res
FROM max_multiple;