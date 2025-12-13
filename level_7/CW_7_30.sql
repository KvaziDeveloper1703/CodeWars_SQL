/*
You are given a table that stores directory paths in a file system.
Your task is to write an SQL query that extracts all direct subdirectories of a specified base directory.

Directories
    - id (integer, primary key) - unique identifier;
    - path (varchar) - full directory path.

Requirements:
    - Select only direct subdirectories: Return directories that are immediately under /home/user/pictures/, regardless of any deeper nested paths;
    - Return only the subdirectory name: The result must contain only the directory name (e.g. books), not the full path;
    - Remove duplicates: Each subdirectory name must appear only once;
    - Sorting: Sort the result in alphabetical order;
    - Output format:Return a single column named subdirectory.

Вам дана таблица, содержащая пути к каталогам файловой системы.
Необходимо написать SQL-запрос, который извлекает все непосредственные подкаталоги заданного базового каталога.

Directories:
    - id (integer, primary key) - уникальный идентификатор;
    - path (varchar) - полный путь к каталогу.

Требования:
    - Выбрать только прямые подкаталоги: Учитываются каталоги, находящиеся непосредственно внутри /home/user/pictures/, независимо от глубины вложенности последующих каталогов;
    - Вернуть только имя подкаталога: В результате должно быть только имя каталога, без полного пути;
    - Исключить дубликаты: Каждое имя подкаталога должно встречаться только один раз;
    - Сортировка: Отсортировать результат по алфавиту;
    - Формат результата: Результат должен содержать один столбец с именем subdirectory.
*/

SELECT DISTINCT regexp_replace(path, '^/home/user/pictures/([^/]+)(/.*)?$', '\1') AS subdirectory
FROM directories
WHERE path ~ '^/home/user/pictures/[^/]+(/|$)'
ORDER BY subdirectory;