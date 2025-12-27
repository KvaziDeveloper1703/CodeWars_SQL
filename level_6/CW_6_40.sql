/*
You are given a table product_variants that stores color and size variants of products in an online shop.

Table structure:
    - id (int) - primary key;
    - product_id (int) - product identifier;
    - color_id (int) - color variant identifier;
    - size_id (int) - size variant identifier;
    - in_stock (boolean) - whether the variant is in stock.

For each product_id, calculate:
    - the total number of unique variants;
    - the number of variants that are in stock.

Output columns:
    - product_id
    - total_unique_variants
    - in_stock_variants

Sort the result by product_id in ascending order.

Дана таблица product_variants, содержащая варианты товаров по цвету и размеру в интернет-магазине.

Структура таблицы:
    - id (int) - первичный ключ;
    - product_id (int) - идентификатор товара;
    - color_id (int) - идентификатор цвета;
    - size_id (int) - идентификатор размера;
    - in_stock (boolean) - наличие на складе.

Для каждого product_id определить:
    - общее количество уникальных вариантов
    - количество вариантов, которые есть в наличии

Итоговые столбцы:
    - product_id
    - total_unique_variants
    - in_stock_variants

Отсортировать результат по product_id по возрастанию.
*/

SELECT product_id, COUNT(DISTINCT (color_id, size_id)) AS total_unique_variants, COUNT(DISTINCT CASE WHEN in_stock = TRUE THEN (color_id, size_id) END) AS in_stock_variants
FROM product_variants
GROUP BY product_id
ORDER BY product_id;