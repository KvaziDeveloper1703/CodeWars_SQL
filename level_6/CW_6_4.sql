/*
For this challenge, you need to create a SELECT statement that returns data about all departments that have made at least one sale with a price greater than 98.00 dollars.

To complete this task, your query must use an EXISTS clause.

Departments table schema:
    - id
    - name

Sales table schema:
    - id
    - department_id
    - name
    - price
    - card_name
    - card_number
    - transaction_date

Resultant table schema:
    - id
    - name

В этом задании вам нужно создать оператор SELECT, который будет возвращать данные о всех департаментах, у которых была хотя бы одна продажа со стоимостью более 98.00 долларов.

Для выполнения задачи в запросе обязательно должен использоваться оператор EXISTS.

Схема таблицы departments:
    - id
    - name

Схема таблицы sales:
    - id
    - department_id
    - name
    - price
    - card_name
    - card_number
    - transaction_date

Схема результата:
    - id
    - name
*/

SELECT departments.id, departments.name
FROM departments
WHERE EXISTS (  SELECT 1
                FROM sales
                WHERE sales.department_id = departments.id
                AND sales.price > 98.00
            );