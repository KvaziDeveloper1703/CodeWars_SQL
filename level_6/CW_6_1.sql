/*
You need to write a SQL query using a HAVING clause.

Count how many people have the same age, and return only those age groups where 10 or more people share that age.

People table schema:
    - id
    - name
    - age

Return table schema:
    - age
    - total_people

The solution must use pure SQL.

Требуется написать SQL-запрос, использующий оператор HAVING.

Нужно подсчитать, сколько людей имеют одинаковый возраст, и вернуть только те группы возрастов, в которых 10 или больше человек.

Схема таблицы people:
    - id
    - name
    - age

Схема результата:
    - age
    - total_people

Решение должно быть написано чистым SQL.
*/

SELECT age, COUNT(*) AS total_people
FROM people
GROUP BY age
HAVING COUNT(*) >= 10;