/*
Create and analyze a contingency table using SQL to study the relationship between two categorical variables: sex and handedness.

You are given a table survey_data with the following columns:
    - id (int);
    - sex (varchar: 'Male' or 'Female');
    - handedness (varchar: 'Right-handed' or 'Left-handed').

Requirements:
    - Write an SQL query that produces a contingency table;
    - Show counts of right-handed and left-handed individuals by sex;
    - Include a Total column and a Total row;
    - Output columns must be: Sex/Handedness, Right-handed, Left-handed, Total.

Output rows must be ordered as:
    - Male
    - Female
    - Total

Создайте и проанализируйте таблицу сопряжённости с помощью SQL для изучения связи между двумя категориальными переменными: пол и ведущая рука.

Дана таблица survey_data со столбцами:
    - id (int);
    - sex (varchar: 'Male' или 'Female');
    - handedness (varchar: 'Right-handed' или 'Left-handed').

Требования:
    - Написать SQL-запрос, формирующий таблицу сопряжённости;
    - Показать количество правшей и левшей по полу;
    - Добавить столбец Total и строку Total;
    - Итоговые столбцы: Sex/Handedness, Right-handed, Left-handed, Total.

Порядок строк:
    - Male
    - Female
    - Total
*/

SELECT "Sex/Handedness", "Right-handed", "Left-handed", "Total"
FROM (
    SELECT 'Male' AS "Sex/Handedness", SUM(CASE WHEN handedness = 'Right-handed' THEN 1 ELSE 0 END) AS "Right-handed", SUM(CASE WHEN handedness = 'Left-handed' THEN 1 ELSE 0 END)  AS "Left-handed", COUNT(*) AS "Total", 1 AS sort_order
    FROM survey_data
    WHERE sex = 'Male'

    UNION ALL

    SELECT 'Female' AS "Sex/Handedness", SUM(CASE WHEN handedness = 'Right-handed' THEN 1 ELSE 0 END), SUM(CASE WHEN handedness = 'Left-handed' THEN 1 ELSE 0 END), COUNT(*), 2
    FROM survey_data
    WHERE sex = 'Female'

    UNION ALL

    SELECT 'Total' AS "Sex/Handedness", SUM(CASE WHEN handedness = 'Right-handed' THEN 1 ELSE 0 END), SUM(CASE WHEN handedness = 'Left-handed' THEN 1 ELSE 0 END), COUNT(*), 3
    FROM survey_data
) t
ORDER BY sort_order;