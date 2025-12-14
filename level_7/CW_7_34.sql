/*
You are working with a PostgreSQL database that contains a table named split_titles.

Table: Split_titles
    - id (INT, primary key): Unique identifier of the record;
    - title (VARCHAR): A string consisting of multiple elements concatenated using the '+' character as a separator.

Each value in the title column may contain one or more elements joined together by the '+' symbol.

Write an SQL query that:
    - Selects each value from the title column;
    - Splits the title string using the '+' character;
    - Extracts only the last element from the split result;
    - Returns NULL as the extracted value if the title does not contain the '+' character;
    - Sorts the output by the id column in descending order.

The result set must contain exactly two columns:
    - title: the original concatenated title;
    - last_part: the last extracted element after splitting, or NULL if no '+' is present.

Вы работаете с базой данных PostgreSQL, в которой есть таблица split_titles.

Таблица: Split_titles
    - id (INT, первичный ключ): уникальный идентификатор записи;
    - title (VARCHAR): строка, состоящая из нескольких элементов, объединённых с помощью символа '+'.

Каждое значение в поле title может содержать один или несколько элементов, разделённых знаком '+'.

Необходимо написать SQL-запрос, который:
    - Выбирает каждое значение из столбца title;
    - Разбивает строку title по символу '+';
    - Извлекает последний элемент после разбиения;
    - Возвращает NULL, если в строке title отсутствует символ '+';
    - Сортирует результат по столбцу id в убывающем порядке.

Результат запроса должен содержать ровно два столбца:
    - title - исходная строка;
    - last_part - последний элемент после разбиения строки либо NULL, если разделитель отсутствует.
*/

SELECT  split_titles.title,
        CASE
            WHEN split_titles.title LIKE '%+%' THEN
                SPLIT_PART(
                    split_titles.title,
                    '+',
                    ARRAY_LENGTH(STRING_TO_ARRAY(split_titles.title, '+'), 1)
                )
            ELSE NULL
        END AS last_part
FROM split_titles
ORDER BY split_titles.id DESC;