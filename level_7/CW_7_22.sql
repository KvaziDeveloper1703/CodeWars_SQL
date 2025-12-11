/*
You own a grocery store, and all your products are stored in a database you built after completing CodeWars SQL exercises.

You realized that you spend too much time visiting many different producers each week. To optimize your work, you want to find out how many different types of products you buy from each producer. If you only get a few items from some producers, you may stop visiting them to save fuel.

Your task:
Return each producer along with the number of different product types you buy from them (count_products_types).

Sort the results by:
    - count_products_types in descending order;
    - producer in ascending order.

Products table:
    - id
    - name
    - price
    - stock
    - producer

Expected output fields:
    - count_products_types
    - producer

Вы владелец продуктового магазина, и все ваши товары находятся в базе данных, которую вы создали после выполнения SQL-упражнений на CodeWars.

Вы поняли, что тратите слишком много времени, посещая множество разных поставщиков каждую неделю. Чтобы оптимизировать работу, вам нужно узнать, сколько различных типов товаров вы покупаете у каждого производителя. Если вы берёте у кого-то слишком мало позиций, можно перестать ездить к нему и экономить бензин.

Задача:
Вывести каждого производителя и количество различных типов товаров, которые вы у него покупаете (count_products_types).

Отсортировать результат по:
    - count_products_types - по убыванию;
    - producer - по возрастанию.

Таблица products:
    - id
    - name
    - price
    - stock
    - producer

Поля результата:
    - count_products_types
    - producer
*/

SELECT producer, COUNT(*) AS count_products_types
FROM products
GROUP BY producer
ORDER BY count_products_types DESC, producer ASC;