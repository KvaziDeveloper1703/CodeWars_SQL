/*
You are given a table categories that stores boundary values for different category segments.

Each category may consist of multiple separate segments, represented only by their start and end boundaries.

Table Structure:
Categories:
    - category (varchar) - category name;
    - range (integer) - boundary value.

Rules / Assumptions:
    - Boundaries come in pairs: start boundary followed by end boundary;
    - The same category can appear multiple times;
    - No two consecutive boundaries belong to the same category;
    - There are no overlaps within or between categories;
    - Every segment has both a start and an end boundary;
    - The table contains only boundary markers, not intermediate values.

Write a SQL query that reconstructs the full range segments for each category.

Expected Output Columns:
    - category - category name;
    - start_range - starting boundary of the segment;
    - end_range - ending boundary of the segment.

Results must be ordered by start_range in ascending order.

Дана таблица categories, в которой хранятся граничные значения сегментов различных категорий.

Каждая категория может состоять из нескольких отдельных диапазонов, представленных только начальной и конечной границами.

Структура таблицы:
Categories:
    - category - название категории;
    - range - граничное числовое значение.

Правила / Допущения
    - Границы идут парами: начало диапазона → конец диапазона;
    - Одна и та же категория может встречаться несколько раз;
    - Две соседние границы не принадлежат одной категории;
    - Пересечений нет ни внутри категории, ни между категориями;
    - У каждого сегмента есть и начало, и конец;
    - В таблице хранятся только границы, без промежуточных чисел.

Написать SQL-запрос, который восстанавливает полные диапазоны для каждого сегмента категории.

Выходные данные
    - category - категория;
    - start_range - начальная граница сегмента;
    - end_range - конечная граница сегмента.

Результат должен быть отсортирован по start_range по возрастанию.
*/

WITH ordered_boundaries AS (
    SELECT
        category,
        range AS start_range,
        LEAD(range) OVER (ORDER BY range) AS end_range,
        LEAD(category) OVER (ORDER BY range) AS next_category
    FROM categories
)
SELECT
    category,
    start_range,
    end_range
FROM ordered_boundaries
WHERE category = next_category
ORDER BY start_range;