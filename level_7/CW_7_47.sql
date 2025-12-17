/*
Your task is to write an SQL query that generates a descending star pattern using PostgreSQL.

The number of stars in the first line must be parameterized. To achieve this, you should use PostgreSQL’s support for prepared statements.

Requirements:
    - Complete the SQL query inside a PREPARE statement;
    - The query must accept one integer parameter, which defines the number of stars in the first row;
    - Use the placeholder $1 to represent this parameter;
    - The output should display a descending pattern of stars:
        - Each subsequent row contains one fewer star than the previous row.
    - If the parameter value is 3, the query must return:
        ***
        **
        *
    - The query must return a single column named star_pattern;
    - Each row of the result must contain a string composed only of asterisks (*).

Ваша задача - написать SQL-запрос, который генерирует убывающий шаблон из звёздочек в PostgreSQL.

Количество звёздочек в первой строке должно быть параметризуемым. Для этого необходимо использовать подготовленные выражения (PREPARE statements) PostgreSQL.

Требования:
    - Необходимо завершить SQL-запрос внутри оператора PREPARE;
    - Запрос должен принимать один целочисленный параметр, определяющий количество звёздочек в первой строке;
    - Для параметра нужно использовать плейсхолдер $1;
    - Результат должен представлять собой убывающий шаблон:
        - В каждой следующей строке на одну звёздочку меньше, чем в предыдущей.
    - Если значение параметра равно 3, запрос должен вернуть:
        ***
        **
        *
    - Запрос должен возвращать один столбец с именем star_pattern;
    - Каждая строка результата должна содержать строку, состоящую только из символов *.
*/

PREPARE draw_pattern(integer) AS
SELECT repeat('*', star_count) AS star_pattern
FROM generate_series($1, 1, -1) AS star_count;