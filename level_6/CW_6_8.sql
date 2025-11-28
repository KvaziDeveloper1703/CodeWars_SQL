/*
Write a SELECT query that returns all prime numbers less than 100, in ascending order.

The result should contain one column named prime.

Напишите запрос SELECT, который выводит все простые числа меньше 100 в порядке возрастания.

Результат должен содержать один столбец с именем prime.
*/

SELECT number AS prime
FROM generate_series(2, 99) AS number
WHERE NOT EXISTS (  SELECT 1
                    FROM generate_series(2, CAST(floor(sqrt(number)) AS integer)) AS divisor
                    WHERE number % divisor = 0
                )
ORDER BY prime ASC;