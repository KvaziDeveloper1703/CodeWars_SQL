/*
Write a simple SELECT query that displays the student information for all ACTIVE students.

TABLE STRUCTURE:
    - students
    - Id (integer)
    - FirstName (text)
    - LastName (text)
    - IsActive (boolean)

Написать простой запрос SELECT, который выводит информацию о студентах, которые являются АКТИВНЫМИ.

СТРУКТУРА ТАБЛИЦЫ:
    - students
    - Id (integer)
    - FirstName (text)
    - LastName (text)
    - IsActive (boolean)
*/

SELECT Id, FirstName, LastName
FROM students
WHERE IsActive = 1;