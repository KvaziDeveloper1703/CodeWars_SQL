/*
You are the owner of a Grocery Store. All your products are stored in the database you created after completing the CodeWars SQL exercises!

Today you are going to the CompanyA warehouse.
You need to check which products are running out of stock so you know what to buy there.

Use a SELECT statement to display id, name, and stock of products that:
    - have 2 or fewer items in stock,
    - are produced by CompanyA.

Order the results by product id.

Products table schema:
    - id
    - name
    - price
    - stock
    - producent

Results table schema:
    - id
    - name
    - stock

Вы - владелец продуктового магазина. Все ваши товары находятся в базе данных, которую вы создали после выполнения SQL-упражнений на CodeWars!

Сегодня вы собираетесь на склад CompanyA.
Вам нужно проверить, какие товары заканчиваются, чтобы знать, что нужно докупить.

Используйте команду SELECT, чтобы вывести id, name и stock тех товаров, которые:
    - имеют 2 единицы на складе или меньше,
    - произведены CompanyA.

Отсортируйте результаты по id товара.

Схема таблицы products:
    - id
    - name
    - price
    - stock
    - producent

Схема таблицы results:
    - id
    - name
    - stock
*/

SELECT id, name, stock
FROM products
WHERE stock <= 2 AND producent = 'CompanyA'
ORDER BY id;