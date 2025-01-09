/*
Write an SQL query to determine if a number n is divisible by two numbers x and y. All inputs (n, x, and y) are positive, non-zero numbers.

Examples:
n = 3, x = 1, y = 3 --> Result: true because 3 is divisible by both 1 and 3.
n = 12, x = 2, y = 6 --> Result: true because 12 is divisible by both 2 and 6.
n = 100, x = 5, y = 3 --> Result: false because 100 is not divisible by 3.

You are provided with a table named kata, containing the columns:
+ id: Unique identifier
+ n: The number to check
+ x and y: Divisors to check against

Return the id and the result of your calculation in a column named res (either true or false) using a SELECT statement.

Напишите SQL-запрос, который проверяет, делится ли число n на два числа x и y. Все входные данные (n, x и y) являются положительными и не равны нулю.

Примеры:
n = 3, x = 1, y = 3 --> Результат: true, так как 3 делится и на 1, и на 3.
n = 12, x = 2, y = 6 --> Результат: true, так как 12 делится и на 2, и на 6.
n = 100, x = 5, y = 3 --> Результат: false, так как 100 не делится на 3.

Дана таблица с названием kata, содержащая столбцы:
+ id: Уникальный идентификатор
+ n: Число, которое нужно проверить
+ x и y: Делители, на которые нужно проверить

Верните id и результат проверки в новом столбце res (либо true, либо false) с помощью запроса SELECT.

https://www.codewars.com/kata/5545f109004975ea66000086
*/

SELECT 
    id,
    CASE 
        WHEN n % x = 0 AND n % y = 0 THEN TRUE
        ELSE FALSE
    END AS res
FROM kata;