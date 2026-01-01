/*
Write an SQL query to group hotel transactions by booking.

Key facts:
    - Each booking has one or two records:
        - the initial booking payment;
        - an optional additional services payment.
    - There are no other payments per booking;
    - Both records share the same transaction ID and name.

Rules:
    - The earliest datetime is the initial booking;
    - The later datetime is additional services;
    - Receipt order must be determined only by datetime, not by receipt name.

Output columns:
    - transaction
    - name
    - initial_booking
    - additional_services

Order by transaction DESC.

Напишите SQL-запрос для группировки транзакций отеля по бронированию.

Факты:
    - Каждое бронирование содержит одну или две записи:
        - первоначальный платёж;
        - необязательный платёж за дополнительные услуги.
    - Других платежей для одного бронирования не бывает;
    - У записей одинаковые transaction и name.

Правила:
    - Запись с самым ранним datetime - это первоначальный платёж;
    - Запись с более поздним datetime - дополнительные услуги;
    - Порядок определяется только по datetime, а не по названию чека.

Выводимые столбцы:
    - transaction
    - name
    - initial_booking
    - additional_services

По transaction по убыванию.

Написать SQL-запрос для группировки транзакций отеля по бронированию.

Важные факты:
    - Каждое бронирование содержит одну или две записи:
        - первоначальный платёж;
        - необязательный платёж за дополнительные услуги.
    - Других платежей для одного бронирования не бывает;
    - У записей одинаковые transaction и name.

Правила:
    - Запись с самым ранним datetime - это первоначальный платёж;
    - Запись с более поздним datetime - дополнительные услуги;
    - Порядок определяется только по datetime, а не по названию чека.

Выводимые столбцы:
    - transaction
    - name
    - initial_booking
    - additional_services

По transaction по убыванию.
*/

WITH ordered_transactions AS (
    SELECT transaction, name, receipt, datetime,
        ROW_NUMBER() OVER (
            PARTITION BY transaction
            ORDER BY datetime
        ) AS transaction_order
    FROM hotel_transactions
)
SELECT transaction, name,
    MAX(
        CASE
            WHEN transaction_order = 1
            THEN receipt || ' (' || datetime::text || ')'
        END
    ) AS initial_booking,
    MAX(
        CASE
            WHEN transaction_order = 2
            THEN receipt || ' (' || datetime::text || ')'
        END
    ) AS additional_services
FROM ordered_transactions
GROUP BY transaction, name
ORDER BY transaction DESC;