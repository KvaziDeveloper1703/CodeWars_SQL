/*
You are given a PostgreSQL table users with columns: id, name, perceived_skill_level, actual_skill_level.

Write an SQL query that:
    - Selects users whose perceived skill level is higher than the actual skill level;
    - Calculates skill_overestimation = perceived - actual;
    - Assigns overconfidence_category:
        - ≤ 2 → Mild case of overconfidence;
        - 3–5 → Moderate case of overconfidence;
        - 6–7 → Serious case of overconfidence;
        - 7 → Extreme case of Dunning-Kruger effect detected!.
    - Returns columns: id, name, skill_overestimation, overconfidence_category;
    - Orders results by skill_overestimation DESC, then id DESC.

Дана таблица PostgreSQL users с полями: id, name, perceived_skill_level, actual_skill_level.

Нужно написать SQL-запрос, который:
    - Выбирает пользователей, у которых самооценка выше реального уровня;
    - Считает skill_overestimation = perceived - actual;
    - Назначает overconfidence_category:
        - ≤ 2 → Mild case of overconfidence;
        - 3-5 → Moderate case of overconfidence;
        - 6-7 → Serious case of overconfidence;
        - 7 → Extreme case of Dunning-Kruger effect detected!.
    - Возвращает: id, name, skill_overestimation, overconfidence_category;
    - Сортирует по skill_overestimation по убыванию, затем по id по убыванию.
*/

SELECT id, name, perceived_skill_level - actual_skill_level AS skill_overestimation,
    CASE
        WHEN perceived_skill_level - actual_skill_level <= 2 THEN 'Mild case of overconfidence'
        WHEN perceived_skill_level - actual_skill_level <= 5 THEN 'Moderate case of overconfidence'
        WHEN perceived_skill_level - actual_skill_level <= 7 THEN 'Serious case of overconfidence'
        ELSE 'Extreme case of Dunning-Kruger effect detected!'
    END AS overconfidence_category
FROM users
WHERE perceived_skill_level > actual_skill_level
ORDER BY skill_overestimation DESC, id DESC;