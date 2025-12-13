/*
You are working with a PostgreSQL database that tracks the progress of tasks within a company project.
Each task goes through several stages, and at each stage a team member may be assigned. Some stages may be skipped or cleared, so the corresponding columns can contain NULL.

Your task is to write an SQL query that determines the second-to-last contributor for each task.

Project_tasks:
    - task_id (int) - unique identifier of the task;
    - initial_assignment (varchar) - team member initially assigned to the task;
    - first_review (varchar) - team member who performed the first review;
    - second_review (varchar) - team member who performed the second review;
    - final_review (varchar) - team member who performed the final review;
    - completion (varchar) - team member who marked the task as completed.

All columns except task_id may contain NULL.

Definition:
    - Last contributor - the rightmost non-NULL value among the stage columns;
    - Second-last contributor - the contributor immediately before the last one in that sequence.

If a task has fewer than two non-NULL contributors, the result should be NULL.

Tasks may skip any number of stages.

Requirements:
    - Determine the second-last non-NULL contributor for each task;
    - Stages must be evaluated in their logical order, not alphabetically;
    - Skipped stages (NULL values) must be ignored;
    - Sort the result by task_id in descending order.
*/

SELECT
    task_id,
    CASE
        WHEN array_length(contributors, 1) >= 2
            THEN contributors[array_length(contributors, 1) - 1]
        ELSE NULL
    END AS second_last_contributor
FROM (
    SELECT
        task_id,
        ARRAY_REMOVE(
            ARRAY[
                initial_assignment,
                first_review,
                second_review,
                final_review,
                completion
            ],
            NULL
        ) AS contributors
    FROM project_tasks
) AS task_contributors
ORDER BY task_id DESC;