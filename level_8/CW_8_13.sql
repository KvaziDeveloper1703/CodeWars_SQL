/*
Write a query to determine if a number n is divisible by two numbers x and y. All inputs (n, x, and y) are positive, non-zero numbers.

You are provided with a table named "kata", containing the columns:
+ id - Unique identifier;
+ n - The number to check;
+ x and y - Divisors to check against.

Return the id and the result of your calculation in a column named "res" using a SELECT statement.

Example:
n = 12, x = 2, y = 6 -> Result: true because 12 is divisible by both 2 and 6

Напишите запрос, который проверяет, делится ли число n на два числа x и y. Все входные данные (n, x и y) являются положительными и не равны нулю.

Пример:
n = 12, x = 2, y = 6 --> Результат: true, так как 12 делится и на 2, и на 6

Дана таблица с названием "kata", содержащая столбцы:
+ id - Уникальный идентификатор;
+ n - Число, которое нужно проверить;
+ x и y - Делители, на которые нужно проверить.

Верните id и результат проверки в новом столбце "res" с помощью запроса SELECT.

https://www.codewars.com/kata/5545f109004975ea66000086
*/

SELECT 
    id,
    CASE 
        WHEN n % x = 0 AND n % y = 0 THEN TRUE
        ELSE FALSE
    END AS res
FROM kata;