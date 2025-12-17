/*
You are given three database tables: students, subjects, and marks, which store information about students, subjects, and the marks obtained by students.

Table Schemas:
Students:
    - student_id (integer) - unique identifier for each student;
    - student_name (varchar) - name of the student;
    - details (varchar) - additional student details.

Subjects:
    - subject_id (varchar) - unique identifier for each subject;
    - subject_name (varchar) - name of the subject.

Marks:
    - student_id (integer) - references the student;
    - subject_id (varchar) - references the subject;
    - mark_rate (integer) - mark obtained by the student in the subject.

Write an SQL query that identifies students who achieved the highest mark compared to all other students in every subject they attended.

Requirements:
    - For each subject, determine the maximum mark achieved among all students;
    - Identify students who have achieved this highest mark in all subjects in which they are enrolled;
    - The result set must include the following columns:
        - student_id - unique identifier of the student;
        - student_name - name of the student.
    - Each student should appear only once in the result set;
    - The final result must be ordered by student_id in descending order.

Даны три таблицы базы данных: students, subjects и marks, которые содержат информацию о студентах, предметах и полученных оценках.

Структура таблиц:
Students:
    - student_id (integer) - уникальный идентификатор студента;
    - student_name (varchar) - имя студента;
    - details (varchar) - дополнительная информация о студенте.

Subjects
    - subject_id (varchar) - уникальный идентификатор предмета;
    - subject_name (varchar) - название предмета.

Marks:
    - student_id (integer) - идентификатор студента;
    - subject_id (varchar) - идентификатор предмета;
    - mark_rate (integer) - оценка, полученная студентом по предмету.

Напишите SQL-запрос, который определяет студентов, набравших наивысшую оценку по сравнению со всеми остальными студентами по каждому предмету, который они посещали.

Требования:
    - Для каждого предмета необходимо определить максимальную оценку среди всех студентов;
    - Необходимо выбрать студентов, которые получили эту максимальную оценку по всем предметам, в которых они обучались;
    - Результат запроса должен содержать следующие столбцы:
        - student_id - уникальный идентификатор студента;
        - student_name - имя студента.
    - Каждый студент должен присутствовать в результирующем наборе только один раз;
    - Итоговый результат должен быть отсортирован по student_id в порядке убывания.
*/

WITH subject_max_marks AS (
    SELECT subject_id, MAX(mark_rate) AS max_mark
    FROM marks
    GROUP BY subject_id
),
student_subject_results AS (
    SELECT marks.student_id, marks.subject_id, marks.mark_rate, subject_max_marks.max_mark
    FROM marks
    JOIN subject_max_marks ON subject_max_marks.subject_id = marks.subject_id
)
SELECT students.student_id, students.student_name
FROM students
JOIN student_subject_results ON student_subject_results.student_id = students.student_id
GROUP BY students.student_id, students.student_name
HAVING
    COUNT(*) = COUNT(
        CASE
            WHEN student_subject_results.mark_rate = student_subject_results.max_mark
            THEN 1
        END
    )
ORDER BY students.student_id DESC;