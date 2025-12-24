/*
You are given two tables: deals and tranches.

The original query groups data by deal and currency, which causes pagination issues because one deal can appear on multiple pages.

Refactor the SQL query so that pagination is based only on deals, not currencies.

Requirements:
    - Aggregate tranches per deal;
    - Group currency data into a JSON array;
    - Each JSON element must contain:
        - currency;
        - total_amount.
    - currency_details must be ordered by currency ASC;
    - Final result must be ordered by deal_id DESC.

Output columns:
    - deal_id
    - deal_name
    - currency_details

Даны таблицы deals и tranches.

Исходный запрос группирует данные по deal + currency, из-за чего один deal может попадать на разные страницы при пагинации.

Переписать SQL-запрос так, чтобы пагинация шла только по сделкам.

Требования:
    - Агрегация по deal;
    - Детали по валютам собрать в JSON-массив;
    - Каждый элемент JSON содержит:
        - currency;
        - total_amount.
    - currency_details отсортирован по currency ASC;
    - Итоговая сортировка по deal_id DESC.

Результат:
    - deal_id
    - deal_name
    - currency_details
*/

SELECT deals.deal_id, deals.deal_name, json_agg(json_build_object('currency', currency_totals.currency, 'total_amount', currency_totals.total_amount) ORDER BY currency_totals.currency ASC) AS currency_details
FROM deals
JOIN (  SELECT tranches.deal_id, tranches.currency, SUM(tranches.amount) AS total_amount
        FROM tranches
        GROUP BY tranches.deal_id, tranches.currency
) AS currency_totals ON currency_totals.deal_id = deals.deal_id
GROUP BY deals.deal_id, deals.deal_name
ORDER BY deals.deal_id DESC;