/*
There are N doors, all initially closed, and N students enter one by one.
    - The i-th student toggles every i-th door;
    - After all students have entered, count how many doors remain open.

Input: n - number of doors and students, 1 ≤ n ≤ 100000.
Output: Number of open doors.

Есть N дверей, все изначально закрыты, и N учеников, которые заходят по очереди.
    - i-й ученик меняет состояние каждой i-й двери;
    - После прихода всех учеников нужно посчитать, сколько дверей остались открытыми.

Входные данные: n - количество дверей и учеников, 1 ≤ n ≤ 100000.
Выходные данные: Количество открытых дверей.
*/

SELECT n, FLOOR(SQRT(n))::int AS res
FROM doors;