/*
You are given tables: landlord, property, and maintenance.

Write an SQL query to generate a monthly invoice for April 2024 for each landlord.

Calculate per landlord:
    - total_rent: sum of rent from all owned properties;
    - total_cost: sum of maintenance costs in April 2024 for those properties;
    - amount_payable: total_rent - total_cost.

Output columns:
    - landlord_id
    - name
    - total_rent
    - total_cost
    - amount_payable

Sorting:
    - total_rent DESC
    - landlord_id DESC

Даны таблицы: landlord, property, maintenance.

Напишите SQL-запрос для формирования ежемесячного отчёта за апрель 2024 по каждому арендодателю.

Для каждого арендодателя нужно посчитать:
    - total_rent: сумма арендной платы по всем его объектам;
    - total_cost: сумма затрат на обслуживание за апрель 2024;
    - amount_payable: total_rent - total_cost.

Результат:
    - landlord_id
    - name
    - total_rent
    - total_cost
    - amount_payable

Сортировка:
    - total_rent по убыванию
    - landlord_id по убыванию
*/

SELECT landlord.id AS landlord_id, landlord.name, COALESCE(rent_totals.total_rent, 0) AS total_rent, COALESCE(maintenance_totals.total_cost, 0) AS total_cost, COALESCE(rent_totals.total_rent, 0) - COALESCE(maintenance_totals.total_cost, 0) AS amount_payable
FROM landlord
LEFT JOIN ( SELECT property.landlord_id, SUM(property.rent) AS total_rent
            FROM property
            GROUP BY property.landlord_id
) AS rent_totals ON rent_totals.landlord_id = landlord.id
LEFT JOIN ( SELECT property.landlord_id, SUM(maintenance.cost) AS total_cost
            FROM property
            JOIN maintenance ON maintenance.property_id = property.id AND maintenance.maintenance_date >= DATE '2024-04-01' AND maintenance.maintenance_date <  DATE '2024-05-01'
            GROUP BY property.landlord_id
) AS maintenance_totals ON maintenance_totals.landlord_id = landlord.id
ORDER BY total_rent DESC, landlord_id DESC;