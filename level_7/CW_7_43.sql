/*
Write an SQL query for the table recipe_priority (id, group_id, recipe, priority) that sorts rows by:
    - group_id ascending
    - Maximum priority per (group_id, recipe) descending
    - recipe ascending (alphabetically)
    - Row priority descending
    - id descending (tie-breaker)

The output must reflect this ordering.

Напиши SQL-запрос для таблицы recipe_priority (id, group_id, recipe, priority), который сортирует строки по:
    - group_id по возрастанию
    - Максимальному priority внутри пары (group_id, recipe) по убыванию
    - recipe по алфавиту (возрастание)
    - priority строки по убыванию
    - id по убыванию (для разрешения совпадений)

Результат должен соответствовать этой иерархии сортировки.
*/

SELECT id, group_id, recipe, priority
FROM (  SELECT id, group_id, recipe, priority, MAX(priority) OVER (PARTITION BY group_id, recipe) AS max_priority_per_recipe
        FROM recipe_priority) AS ranked_recipes
ORDER BY group_id ASC, max_priority_per_recipe DESC, recipe ASC, priority DESC, id DESC;