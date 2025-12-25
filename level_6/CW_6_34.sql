/*
Given tables house_tasks and task_status, write a SQL query that returns a report per house with:
    - house_id;
    - total_tasks: total tasks for the house;
    - completed_tasks: tasks where all related statuses are 'Completed';
    - incomplete_tasks: tasks where any status is not 'Completed' or the task has no status records.

Order the result by house_id DESC.

Даны таблицы house_tasks и task_status. Напиши SQL-запрос, который формирует отчёт по каждому дому:
    - house_id;
    - total_tasks: общее число задач дома;
    - completed_tasks: задачи, у которых все статусы 'Completed';
    - incomplete_tasks: задачи, у которых есть не 'Completed' статус или нет записей статуса.

Отсортируй результат по house_id по убыванию.
*/

SELECT
    house_tasks.house_id,
    COUNT(*) AS total_tasks,
    SUM(
        CASE
            WHEN COALESCE(task_summary.status_count, 0) > 0
             AND COALESCE(task_summary.not_completed_count, 0) = 0
            THEN 1
            ELSE 0
        END
    ) AS completed_tasks,
    SUM(
        CASE
            WHEN COALESCE(task_summary.status_count, 0) = 0
              OR COALESCE(task_summary.not_completed_count, 0) > 0
            THEN 1
            ELSE 0
        END
    ) AS incomplete_tasks
FROM house_tasks
LEFT JOIN (
    SELECT
        task_status.task_id,
        COUNT(*) AS status_count,
        SUM(
            CASE
                WHEN task_status.task_status <> 'Completed'
                  OR task_status.task_status IS NULL
                THEN 1
                ELSE 0
            END
        ) AS not_completed_count
    FROM task_status
    GROUP BY task_status.task_id
) task_summary ON task_summary.task_id = house_tasks.task_id
GROUP BY house_tasks.house_id
ORDER BY house_tasks.house_id DESC;