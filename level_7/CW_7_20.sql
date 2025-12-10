/*
You are the owner of a Grocery Store. All your products are stored in the database you created after completing the CodeWars SQL exercises!

You care about supporting the local market and want to check how many products come from the United States of America or Canada.

Use a SELECT statement together with IN to filter out all other countries.

In the results, show how many products come from the United States of America and how many come from Canada, respectively.

Order the results by the number of products in descending order.

Products table schema:
    - id
    - name
    - price
    - stock
    - producer
    - country

Results table schema:
    - products
    - country

Вы - владелец продуктового магазина. Все ваши товары находятся в базе данных, которую вы создали после выполнения SQL-упражнений на CodeWars!

Вы поддерживаете локальный рынок и хотите узнать, сколько товаров поступает из Соединённых Штатов Америки и Канады.

Используйте оператор SELECT вместе с IN, чтобы отфильтровать товары из других стран.

В результате выведите, сколько товаров США и сколько Канады - отдельно для каждой страны.

Отсортируйте результат по количеству товаров в убывающем порядке.

Схема таблицы products:
    - id
    - name
    - price
    - stock
    - producer
    - country

Схема результата:
    - products
    - country
*/

SELECT COUNT(*) AS products, country
FROM products
WHERE country IN ('United States of America', 'Canada')
GROUP BY country
ORDER BY products DESC;