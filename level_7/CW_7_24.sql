/*
You are helping a tech company streamline its hiring process by grouping all job applications into two categories based on their evaluation status.

Applications come from the applications table, which contains:
    - application_id - primary key;
    - application_status - an integer representing the evaluation result.

Rules for categorizing applications:
    - Rejected: application_status ≤ 5;
    - Approved: application_status > 5.

Your task is to write a query that returns two rows:
    - status_group - either 'Rejected' or 'Approved';
    - application_num - the number of applications in that group.

Both categories must appear in the result, even if the count for one group is zero.
The output should list 'Rejected' first, then 'Approved'.

Вы помогаете IT-компании оптимизировать процесс найма, распределяя все заявки кандидатов на две группы по результатам их оценки.

Заявки хранятся в таблице applications, содержащей:
    - application_id - первичный ключ;
    - application_status - число, отражающее результат оценки.

Правила классификации:
    - Rejected - если application_status ≤ 5;
    - Approved - если application_status > 5.

Нужно написать запрос, который вернёт две строки:
    - status_group - 'Rejected' или 'Approved';
    - application_num - количество заявок в каждой категории.

Обе категории должны отображаться всегда, даже если в какой-то группе 0 заявок.
В выводе сначала должна идти строка 'Rejected', затем 'Approved'.
*/

WITH status_groups AS (
    SELECT 'Rejected' AS status_group
    UNION ALL
    SELECT 'Approved' AS status_group
),
categorized_applications AS (
    SELECT 
        CASE 
            WHEN applications.application_status <= 5 THEN 'Rejected'
            ELSE 'Approved'
        END AS status_group
    FROM applications
)
SELECT 
    status_groups.status_group,
    COUNT(categorized_applications.status_group) AS application_num
FROM status_groups
LEFT JOIN categorized_applications
    ON status_groups.status_group = categorized_applications.status_group
GROUP BY status_groups.status_group
ORDER BY 
    CASE status_groups.status_group
        WHEN 'Rejected' THEN 1
        ELSE 2
    END;