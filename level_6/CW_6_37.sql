/*
You are given a table developer_attributes that describes different stages of a developer’s career.

Table structure:
    - developer_title - developer level;
    - attribute - a characteristic or behavior associated with that level.

Task:
    - Retrieve all distinct developer titles;
    - For each title, list its corresponding attributes below it;
    - Developer titles must be visually highlighted by formatting them as: *** Title ***;
    - The output must contain one column named description.

Ordering:
    - Sort developer titles in alphabetical order (ASC);
    - Sort attributes alphabetically (ASC) within each title.

Output format:
    - Each developer title appears once, formatted with asterisks;
    - All attributes belonging to that title follow it;
    - The result should clearly separate titles from their attributes.

Дана таблица developer_attributes, описывающая разные уровни карьеры разработчика.

Структура таблицы:
    - developer_title - уровень разработчика;
    - attribute - характеристика или особенность данного уровня.

Задача:
    - Выбрать все уникальные уровни разработчиков;
    - Для каждого уровня вывести список его характеристик ниже;
    - Названия уровней должны быть визуально выделены в формате: *** Название ***;
    - В результате должна быть одна колонка с именем description.

Сортировка:
    - Уровни разработчиков - по алфавиту;
    - Характеристики внутри каждого уровня - по алфавиту.

Формат результата:
    - Каждый уровень выводится один раз, в выделенном виде;
    - Ниже идут все связанные с ним характеристики;
    - Результат должен наглядно разделять уровни и их атрибуты.
*/

WITH titles AS (
    SELECT DISTINCT developer_title
    FROM developer_attributes
),
formatted AS (
    SELECT developer_title, 0 AS sort_key, '*** ' || developer_title || ' ***' AS description
    FROM titles

    UNION ALL

    SELECT developer_title, 1 AS sort_key, attribute AS description
    FROM developer_attributes
)
SELECT description
FROM formatted
ORDER BY developer_title ASC, sort_key ASC, description ASC;