/*
You are given tables: sales, product_prices, and customer_reviews.

Write an SQL query that, for each sale, returns:
    - the most recent product price at or before the sale time;
    - the most recent customer review rating at or before the sale time.

Rules:
    - Exclude sales if no price exists at or before the sale time;
    - Include sales without reviews, showing NULL for review_rating.

Output columns:
    - sale_time
    - product_id
    - price
    - review_rating

Sorting:
    - sale_time DESC
    - sales.id DESC

Даны таблицы: sales, product_prices, customer_reviews.

Напишите SQL-запрос, который для каждой продажи возвращает:
    - последнюю цену товара на момент продажи или раньше;
    - последний отзыв на момент продажи или раньше.

Условия:
    - Продажи без цены до момента продажи - исключить;
    - Продажи без отзывов - оставить, review_rating = NULL.

Результат:
    - sale_time
    - product_id
    - price
    - review_rating

Сортировка:
    - sale_time по убыванию
    - sales.id по убыванию
*/

SELECT sales.sale_time::text AS sale_time, sales.product_id, latest_price.price, latest_review.review_rating
FROM sales
JOIN LATERAL (  SELECT product_prices.price
                FROM product_prices
                WHERE product_prices.product_id = sales.product_id AND product_prices.price_time <= sales.sale_time
                ORDER BY product_prices.price_time DESC
                LIMIT 1
) AS latest_price ON TRUE
LEFT JOIN LATERAL ( SELECT customer_reviews.review_rating
                    FROM customer_reviews
                    WHERE customer_reviews.product_id = sales.product_id AND customer_reviews.review_time <= sales.sale_time
                    ORDER BY customer_reviews.review_time DESC
                    LIMIT 1
) AS latest_review ON TRUE
ORDER BY sales.sale_time DESC, sales.id DESC;