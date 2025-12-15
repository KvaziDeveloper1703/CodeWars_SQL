/*
You are given a table restaurants that violates First Normal Form (1NF) because the menu column contains multiple values.

Normalize the database to First Normal Form (1NF) by splitting the data into two tables.

Requirements:
    - Create a restaurants table without the menu column;
        - Columns: id, name, stars;
    - Create a dishes table that stores:
        - restaurant_id;
        - dish.
    - Each dish from menu must be stored as a separate row in dishes;
    - Order of rows does not matter;
    - Final database must contain only these two tables:
        - restaurants;
        - dishes.

Дана таблица restaurants, которая не соответствует первой нормальной форме (1NF), так как поле menu содержит несколько значений.

Нормализовать таблицу до First Normal Form (1NF), разделив данные на две таблицы.

Требования:
    - Создать таблицу restaurants без поля menu;
    - Столбцы: id, name, stars;
    - Создать таблицу dishes со столбцами:
        - restaurant_id;
        - dish.
    - Каждое блюдо из menu должно быть записано отдельной строкой;
    - Порядок строк не важен;
    - В базе данных после выполнения должно остаться ровно две таблицы:
        - restaurants;
        - dishes.
*/

DROP TABLE IF EXISTS dishes;

CREATE TABLE dishes (restaurant_id INT, dish TEXT);

INSERT INTO dishes (restaurant_id, dish)
SELECT restaurants.id AS restaurant_id, trim(dish_item) AS dish
FROM restaurants
CROSS JOIN LATERAL unnest(string_to_array(restaurants.menu, ',')) AS dish_item;

ALTER TABLE restaurants
DROP COLUMN menu;