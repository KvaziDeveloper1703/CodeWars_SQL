/*
You need to implement a PostgreSQL PL/pgSQL function named draw_heart.

Function signature:
create or replace function draw_heart(size integer)
returns table(heart_shape text)

Input:
    - size - an integer defining the size of the heart;
    - Minimum allowed value: 4.

Output:
    - The function returns a table with one column: heart_shape;
    - Each row represents one line of an ASCII heart;
    - The heart is drawn using:
        - * (asterisks) for the shape;
        - spaces for alignment.

The exact formatting (spaces and asterisks) must match the expected output in the tests.

Необходимо реализовать функцию PostgreSQL на PL/pgSQL с именем draw_heart.

Сигнатура функции:
create or replace function draw_heart(size integer)
returns table(heart_shape text)

Входные данные:
    - size - целое число, определяющее размер сердца;
    - Минимальное значение: 4.

Выходные данные:
    - Функция возвращает таблицу с одним столбцом heart_shape;
    - Каждая строка таблицы - это одна строка ASCII-рисунка сердца;
    - Сердце рисуется с помощью:
        - символов *;
        - пробелов для выравнивания.

Форматирование (количество пробелов и *) должно точно соответствовать ожидаемому результату тестов.
*/

CREATE OR REPLACE FUNCTION draw_heart(size INTEGER)
RETURNS TABLE(heart_shape TEXT) AS $$
DECLARE
    row_index INTEGER;
    stars_per_lobe INTEGER;
    stars_count INTEGER;
BEGIN
    IF size < 4 THEN
        RAISE EXCEPTION 'size must be >= 4';
    END IF;
    stars_per_lobe := size - 3;
    heart_shape :=
        ' ' ||
        REPEAT('*', stars_per_lobe) ||
        ' ' ||
        REPEAT('*', stars_per_lobe);
    RETURN NEXT;

    heart_shape := REPEAT('*', 2 * size - 3);
    RETURN NEXT;

    FOR row_index IN 1..(size - 2) LOOP
        stars_count := (2 * size - 3) - 2 * row_index;

        heart_shape :=
            REPEAT(' ', row_index) ||
            REPEAT('*', stars_count);
        RETURN NEXT;
    END LOOP;

    RETURN;
END;
$$ LANGUAGE plpgsql;