/*
Write an SQL query to select cakes that meet specific decoration and availability rules.

Cake name format: Cake names consist of letters followed by digits.

Rules:
    - Each cake has exactly one icing;
    - Each cake is associated with exactly three different sprinkles;
    - The cake must be selected only if:
        - The icing is not consumed;
        - All three sprinkles are not consumed.

Return only the cake name. Column name must be: cake.

Sort results in natural ascending order:
    - Alphabetical part first;
    - Numerical part numerically.

Напишите SQL-запрос для выбора тортов по условиям оформления и доступности ингредиентов.

Формат имени торта: Имя состоит из букв и цифр в конце.

Условия:
    - У каждого торта ровно одна глазурь;
    - Каждый торт связан ровно с тремя разными посыпками;
    - Торт выбирается только если:
        - Глазурь не израсходована;
        - Все три посыпки не израсходованы.

Вернуть только имя торта. Название столбца: cake.

Естественная сортировка по возрастанию:
    - Сначала по буквенной части;
    - Затем по числовой части.
*/

SELECT cakes.cake
FROM cakes
JOIN icings ON icings.icing = cakes.icing AND icings.consumed = false
JOIN reserved_sprinkles ON reserved_sprinkles.cake = cakes.cake
JOIN sprinkles ON sprinkles.sprinkle = reserved_sprinkles.sprinkle
GROUP BY cakes.cake
HAVING COUNT(DISTINCT reserved_sprinkles.sprinkle) = 3 AND BOOL_AND(sprinkles.consumed = false)
ORDER BY REGEXP_REPLACE(cakes.cake, '\d+$', ''), CAST(REGEXP_REPLACE(cakes.cake, '^\D+', '') AS INTEGER);