/*
You are given two tables: customers and loans.

Write an SQL query that:
    - Selects customers with id between 1 and 10;
    - Returns:
        - customer_id (customers.id);
        - loan eligibility:
            - 'loan can be given' if the customer is 18–65 years old and has no loans or all loans are paid;
            - 'loan cannot be given' otherwise.
    - Sorts the results by customer_id DESC.

Даны две таблицы: customers и loans.

Нужно написать SQL-запрос, который:
    - Выбирает клиентов с id от 1 до 10;
    - Возвращает:
        - customer_id (customers.id);
        - решение по кредиту:
            - 'loan can be given', если возраст от 18 до 65 лет и нет кредитов или все кредиты оплачены;
            - 'loan cannot be given' в остальных случаях.
    - Сортирует результат по customer_id по убыванию.
*/

SELECT  customers.id AS customer_id,
        CASE
            WHEN customers.age BETWEEN 18 AND 65
                AND COALESCE(
                    SUM(
                        CASE
                            WHEN loans.loan_status = 'unpaid' THEN 1
                            ELSE 0
                        END
                    ), 0
                ) = 0
            THEN 'loan can be given'
        ELSE 'loan cannot be given'
    END AS loan_eligibility
FROM customers
LEFT JOIN loans ON customers.id = loans.customer_id
WHERE customers.id BETWEEN 1 AND 10
GROUP BY customers.id, customers.age
ORDER BY customer_id DESC;