/*
Given a divisor and a bound, find the largest integer N such that:
+ N is divisible by divisor
+ N is less than or equal to bound
+ N is greater than 0

Даны делитель (divisor) и граница (bound). Найдите наибольшее целое число N, которое удовлетворяет следующим условиям:
+ N делится на divisor без остатка
+ N меньше или равно bound
+ N больше 0
*/

SELECT (bound / divisor) * divisor AS res
FROM max_multiple;