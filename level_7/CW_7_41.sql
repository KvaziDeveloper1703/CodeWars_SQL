/*
Write a parameterized PostgreSQL prepared statement find_sections that takes a user ID ($1, integer) and returns only the sections accessible to that user.

The table section_access has columns: id, section_name, user_access (comma-separated user IDs).

The result must include only id and section_name, ordered by id ascending.

Напиши параметризованный подготовленный SQL-запрос PostgreSQL find_sections, который принимает ID пользователя ($1, тип integer) и возвращает только те разделы, к которым у пользователя есть доступ.

Таблица section_access содержит поля: id, section_name, user_access (ID пользователей через запятую).

Результат должен содержать только id и section_name, отсортированные по id по возрастанию.
*/

PREPARE find_sections(int) AS
SELECT id, section_name
FROM section_access
WHERE $1 = ANY (string_to_array(user_access, ',')::int[])
ORDER BY id ASC;