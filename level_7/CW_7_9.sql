/*
Write a function that takes a positive integer n, sums all the cubed values from 1 to n (inclusive), and returns that sum.

Напишите функцию, которая принимает положительное целое число n, вычисляет сумму кубов всех чисел от 1 до n (включительно) и возвращает эту сумму.
*/

SELECT n, (n * (n + 1) / 2) * (n * (n + 1) / 2) AS res
FROM cubes
ORDER BY n ASC;