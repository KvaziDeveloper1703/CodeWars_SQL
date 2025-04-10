/*
You will be given a table "numbers" with one column "number".
You need to return a dataset with two columns: "number" and "is_even". The "number" column should contain the original values, and the "is_even" column should contain the strings "Even" or "Odd" based on the values in the "number" column.

Input Table Schema:
number INT

Output Table Schema:
number INT
is_even STRING

Вам будет предоставлена таблица "numbers" с одним столбцом "number".
Необходимо вернуть набор данных с двумя столбцами: "number" и "is_even". В столбце "number" должны быть исходные значения, а в столбце "is_even" — строки "Even" или "Odd" в зависимости от значения столбца "number".

Схема таблицы входных данных:
number INT

Схема таблицы выходных данных:
number INT
is_even STRING

https://www.codewars.com/kata/53da3dbb4a5168369a0000fe
*/

SELECT 
    number,
    CASE 
        WHEN number % 2 = 0 THEN 'Even'
        ELSE 'Odd'
    END AS is_even
FROM numbers;