/*
Write a SQL query to calculate the percentage of orders that resulted in an error during the last hour (the most recent 60 minutes, excluding records exactly 1 hour old).

Use tables order_processing and order_errors (same schema: id, order_id, order_time).

Count records in both tables within this period and compute the error percentage as (errors / total orders) * 100, rounded to two decimal places, with alias error_percentage.

If there are no orders in order_processing, return NULL and avoid division by zero.

Напиши SQL-запрос, который вычисляет процент заказов с ошибкой за последний час (последние 60 минут, не включая записи ровно часовой давности).

Используются таблицы order_processing и order_errors (одинаковая схема: id, order_id, order_time).

Нужно посчитать количество записей за этот период и вычислить процент ошибок (ошибки / все заказы) * 100, округлив до двух знаков, с псевдонимом error_percentage.

Если в order_processing нет заказов, результат должен быть NULL, без деления на ноль.
*/

SELECT
    ROUND(
        (
            SELECT COUNT(*)
            FROM order_errors
            WHERE order_time > NOW() - INTERVAL '1 hour'
              AND order_time < NOW()
        )::numeric * 100
        /
        NULLIF(
            (
                SELECT COUNT(*)
                FROM order_processing
                WHERE order_time > NOW() - INTERVAL '1 hour'
                  AND order_time < NOW()
            ),
            0
        ),
        2
    ) AS error_percentage;