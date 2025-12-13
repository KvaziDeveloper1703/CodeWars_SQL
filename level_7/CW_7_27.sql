/*
ABC Kata Solutions is celebrating its 10-year anniversary. To analyze how resources were allocated during this time, you are asked to work with project budget data.

Your task is to write an SQL query that identifies all projects whose total budget exceeds the average project budget and that were never marked as completed.

You are given two tables:
Projects:
    - project_id (int, primary key) - unique identifier of the project;
    - project_name (varchar, unique) - name of the project;
    - completion_status (varchar) - project status.

Budget_components:
    - id (int, primary key) - unique identifier of the record;
    - project_id (int) - foreign key referencing projects.project_id;
    - component_value (numeric) - monetary value of a budget component.

Requirements:
    - Calculate the total budget for each project: Sum all component_value entries for each project_id;
    - Calculate the average total project budget: Compute the average of all projects’ total budgets;
    - Filter projects by budget: Select only projects whose total budget is greater than the calculated average;
    - Exclude completed projects: Include only projects whose completion_status is not equal to 'Completed';
    - Sort the result: Order the output by project_name in ascending order.

Компания ABC Kata Solutions отмечает своё 10-летие. Для анализа распределения ресурсов необходимо изучить бюджеты проектов.

Ваша задача - написать SQL-запрос, который определяет проекты, чей суммарный бюджет превышает средний бюджет по всем проектам, и которые никогда не были завершены.

Даны две таблицы:
Projects:
    - project_id (int, primary key) - уникальный идентификатор проекта;
    - project_name (varchar, unique) - название проекта;
    - completion_status (varchar) - статус проекта.

Budget_components:
    - id (int, primary key) - уникальный идентификатор записи;
    - project_id (int) - внешний ключ на projects.project_id;
    - component_value (numeric) - значение бюджетной составляющей.

Требования:
    - Рассчитать общий бюджет каждого проекта: Суммировать все значения component_value для каждого проекта;
    - Вычислить средний бюджет по всем проектам: Найти среднее значение от суммарных бюджетов проектов;
    - Отфильтровать проекты по бюджету: Оставить только проекты, чей суммарный бюджет больше среднего;
    - Исключить завершённые проекты: Учитываются только проекты со статусом, отличным от 'Completed';
    - Отсортировать результат: Отсортировать по project_name по возрастанию.
*/

WITH projects_with_total_budget AS (
    SELECT
        projects.project_id AS project_id,
        projects.project_name AS project_name,
        projects.completion_status AS completion_status,
        SUM(budget_components.component_value)::money AS total_project_budget
    FROM projects
    INNER JOIN budget_components
        ON projects.project_id = budget_components.project_id
    GROUP BY
        projects.project_id,
        projects.project_name,
        projects.completion_status
),
average_project_budget AS (
    SELECT
        AVG(total_project_budget::numeric) AS average_budget_value
    FROM projects_with_total_budget
)
SELECT
    projects_with_total_budget.project_id,
    projects_with_total_budget.project_name,
    projects_with_total_budget.completion_status,
    projects_with_total_budget.total_project_budget AS total_budget
FROM projects_with_total_budget
CROSS JOIN average_project_budget
WHERE
    projects_with_total_budget.total_project_budget::numeric
        > average_project_budget.average_budget_value
    AND projects_with_total_budget.completion_status <> 'Completed'
ORDER BY
    projects_with_total_budget.project_name ASC;