/*
You are given a table messages with text content.

Write an SQL query that finds messages containing the word "apple" at least twice.

Rules:
    - The search must be case-insensitive;
    - "apple" can appear inside other words;
    - Only messages with two or more occurrences should be returned.

Output columns:
    - id
    - message
    - second_occurrence_position - the starting position of the second occurrence of "apple"

Sorting: Order results by id in descending order.

Дана таблица messages, содержащая текстовые сообщения.

Нужно написать SQL-запрос, который находит сообщения, где слово "apple" встречается минимум два раза.

Правила:
    - Поиск нечувствителен к регистру;
    - "apple" может быть частью другого слова;
    - Возвращать только сообщения с двумя и более вхождениями.

Выводимые столбцы:
    - id
    - message
    - second_occurrence_position - позиция начала второго вхождения слова "apple"

Сортировка: По id по убыванию.
*/

SELECT messages.id, messages.message, first_position + strpos(lower(substr(messages.message, first_position + 1)),'apple') AS second_occurrence_position
FROM (  SELECT id, message, strpos(lower(message), 'apple') AS first_position
        FROM messages) AS messages
WHERE first_position > 0 AND strpos(lower(substr(message, first_position + 1)), 'apple') > 0
ORDER BY messages.id DESC;