/*
Complete the SQL query inside a PREPARE statement to generate factorials from 1 to n.

Task:
    - Write a prepared SQL query named generate_factorial;
    - The query accepts one integer parameter n (use $1);
    - Generate numbers from 1 to n and calculate their factorials.

Requirements:
    - Input: single integer n where 1 ≤ n ≤ 12;
    - Output columns:
        - n - number;
        - result - factorial of n.
    - result must be of integer type;
    - Output rows from 1 to n.

Завершите SQL-запрос внутри оператора PREPARE, который генерирует факториалы чисел от 1 до n.

Задача:
    - Написать подготовленный SQL-запрос с именем generate_factorial;
    - Запрос принимает один целочисленный параметр n (использовать $1);
    - Сгенерировать числа от 1 до n и вычислить их факториалы.

Требования:
    - Вход: одно целое число n, где 1 ≤ n ≤ 12;
    - Выходные столбцы:
        - n - число;
        - result - факториал числа.
    - result должен быть целого типа;
    - Вернуть строки от 1 до n.
*/

PREPARE generate_factorial(int) AS
WITH RECURSIVE factorials AS (
    SELECT
        1 AS n,
        1::int AS result
    UNION ALL
    SELECT
        n + 1,
        result * (n + 1)
    FROM factorials
    WHERE n < $1
)
SELECT
    n,
    result
FROM factorials
ORDER BY n;