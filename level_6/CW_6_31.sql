/*
Write a parameterized SQL query that, given a base directory path ($1), returns the names of all direct subdirectories from a table of directory paths.
Return one column (subdirectory), no duplicates, sorted alphabetically.

Напиши параметризованный SQL-запрос, который по базовому пути ($1) возвращает имена всех прямых подкаталогов из таблицы путей.
Верни один столбец (subdirectory), без дубликатов, с алфавитной сортировкой.
*/

PREPARE get_direct_subdirectories(text) AS
SELECT DISTINCT split_part(substring(path FROM '^' || $1 || '([^/]+)'), '/', 1) AS subdirectory
FROM directories
WHERE path LIKE $1 || '%' AND path <> $1
ORDER BY subdirectory;