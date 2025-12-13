/*
You are working with a retail inventory database that stores information about items grouped into categories.
Within the same category, item names may be duplicated, and the system needs a way to uniquely identify these items without changing the original name of the first occurrence.

Your task is to write an SQL query that assigns numeric suffixes to duplicate item names within each category.

Items:
    - item_id (integer) - unique identifier of an item;
    - category_id (integer) - identifier of the category the item belongs to;
    - item_name (string) - name of the item.

Requirements:
    - Handle duplicates within each category: Item names should be considered duplicates only within the same category_id;
    - Case-insensitive comparison: Item names that differ only by letter case must be treated as duplicates;
    - Suffix assignment:
        - The item with the smallest item_id keeps its original name;
        - Subsequent duplicates receive a suffix: _2, _3, _4, etc;
        - Suffix numbering must follow the order of item_id in ascending order.
    - Do not modify unique names: Item names that appear only once within a category must remain unchanged;
    - Sorting:
        - Order the result by category_id in ascending order;
        - Within each category, order by item_id in ascending order.

Вы работаете с базой данных розничной компании, в которой хранится информация о товарах, сгруппированных по категориям.
В рамках одной категории названия товаров могут повторяться, и требуется уникально их идентифицировать, не изменяя название первого экземпляра.

Ваша задача - написать SQL-запрос, который добавляет числовые суффиксы к дублирующимся названиям товаров в пределах одной категории.

Items:
    - item_id (integer) - уникальный идентификатор товара;
    - category_id (integer) - идентификатор категории;
    - item_name (string) - название товара.

Требования:
    - Обработка дубликатов внутри категории: Названия считаются дубликатами только в пределах одного category_id;
    - Регистронезависимое сравнение: Названия, отличающиеся только регистром (Phone и phone), считаются одинаковыми;
    - Присвоение суффиксов:
        - Товар с наименьшим item_id сохраняет исходное название;
        - Каждому следующему дубликату добавляется суффикс: _2, _3, _4 и т.д;
        - Нумерация выполняется в порядке возрастания item_id.
    - Уникальные названия не изменяются;
    - Сортировка результата:
        - Сначала по category_id по возрастанию;
        - Внутри категории - по item_id по возрастанию.
*/

SELECT
    items.item_id,
    items.category_id,
    CASE
        WHEN item_sequence_number = 1 THEN items.item_name
        ELSE items.item_name || '_' || item_sequence_number
    END AS item_name
FROM (
    SELECT
        item_id,
        category_id,
        item_name,
        ROW_NUMBER() OVER (
            PARTITION BY category_id, LOWER(item_name)
            ORDER BY item_id
        ) AS item_sequence_number
    FROM items
) AS items
ORDER BY items.category_id ASC, items.item_id ASC;