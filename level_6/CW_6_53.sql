/*
You have three tables: students, courses, and enrollments.

Write a SQL query that builds a student–course matrix using only active students and courses.

Requirements:
    - Include only students and courses that exist in the enrollments table;
    - For every active student and every active course, show whether the student is enrolled in that course.

Output columns:
    - student - formatted as "Name (student_id)";
    - course - formatted as "Course name (course_id)";
    - is_exists - 1 if enrolled, 0 otherwise.

Sort results by student_id, then by course_id.

Есть три таблицы: students, courses и enrollments.

Написать SQL-запрос, который формирует матрицу студент–курс, используя только активных студентов и курсы.

Требования:
    - Включать только студентов и курсы, которые есть в enrollments;
    - Для каждой пары активный студент - активный курс указать, записан ли студент на курс.

Выходные столбцы:
    - student - строка вида "Имя (student_id)";
    - course - строка вида "Название курса (course_id)";
    - is_exists - 1, если студент записан, иначе 0.

Отсортировать по student_id, затем по course_id.
*/

WITH active_students AS (
    SELECT DISTINCT students.student_id, students.name
    FROM students
    JOIN enrollments ON enrollments.student_id = students.student_id
),
active_courses AS (
    SELECT DISTINCT courses.course_id, courses.course_name
    FROM courses
    JOIN enrollments ON enrollments.course_id = courses.course_id
)
SELECT active_students.name || ' (' || active_students.student_id || ')' AS student, active_courses.course_name || ' (' || active_courses.course_id || ')' AS course, CASE WHEN enrollments.student_id IS NOT NULL THEN 1 ELSE 0 END AS is_exists
FROM active_students
CROSS JOIN active_courses
LEFT JOIN enrollments ON enrollments.student_id = active_students.student_id AND enrollments.course_id = active_courses.course_id
ORDER BY active_students.student_id ASC, active_courses.course_id ASC;