/*
You are given three database tables: students, subjects, and marks, which together store information about students, subjects, and the marks students received.

Table Schemas:
Students:
    - student_id (integer) - unique identifier of a student;
    - student_name (varchar) - name of the studen;
    - details (varchar) - additional student information (may contain a static value such as 'X').

Subjects:
    - subject_id (varchar) - unique identifier of a subject;
    - subject_name (varchar) - name of the subject.

Marks:
    - student_id (integer) - references the student;
    - subject_id (varchar) - references the subject;
    - mark_rate (integer) - mark obtained by the student for the subject.

Write an SQL query that returns, for each subject, the students who achieved the highest mark in that subject.

Requirements:
    - For each subject, identify the maximum mark (mark_rate) achieved;
    - For each subject, collect the names of all students who achieved this highest mark;
    - The student names must be returned as an array, ordered by student_id in ascending order;
    - The result set must include the following columns:
        - student_names (varchar[]) - array of student names with the highest mark;
        - subject_name (varchar) - name of the subject;
        - mark_rate (integer) - highest mark achieved for the subject.
    - The final result must be ordered by subject_id in ascending order.

Даны три таблицы базы данных: students, subjects и marks, которые хранят информацию о студентах, предметах и оценках.

Структура таблиц:
Students:
    - student_id (integer) - уникальный идентификатор студента;
    - student_name (varchar) - имя студента;
    - details (varchar) - дополнительная информация о студенте.

Subjects:
    - subject_id (varchar) - уникальный идентификатор предмета;
    - subject_name (varchar) - название предмета.

Marks:
    - student_id (integer) - идентификатор студента;
    - subject_id (varchar) - идентификатор предмета;
    - mark_rate (integer) - оценка, полученная студентом по предмету.

Напишите SQL-запрос, который для каждого предмета определяет студентов, набравших наивысшую оценку по этому предмету.

Требования:
    - Для каждого предмета необходимо определить максимальную оценку;
    - Для каждого предмета нужно собрать имена всех студентов, получивших эту максимальную оценку;
    - Имена студентов должны быть возвращены в виде массива, отсортированного по student_id в возрастающем порядке;
    - Результат запроса должен содержать следующие столбцы:
        - student_names (varchar[]) - массив имён студентов с максимальной оценкой;
        - subject_name (varchar) - название предмета;
        - mark_rate (integer) - наивысшая оценка по предмету.
    - Итоговый набор данных должен быть отсортирован по subject_id в возрастающем порядке.
*/

WITH max_marks AS (
    SELECT subject_id, MAX(mark_rate) AS max_mark
    FROM marks
    GROUP BY subject_id
)
SELECT ARRAY_AGG(students.student_name ORDER BY students.student_id) AS student_names, subjects.subject_name, max_marks.max_mark AS mark_rate
FROM max_marks
JOIN marks ON marks.subject_id = max_marks.subject_id AND marks.mark_rate = max_marks.max_mark
JOIN students ON students.student_id = marks.student_id
JOIN subjects ON subjects.subject_id = max_marks.subject_id
GROUP BY subjects.subject_id, subjects.subject_name, max_marks.max_mark
ORDER BY subjects.subject_id ASC;