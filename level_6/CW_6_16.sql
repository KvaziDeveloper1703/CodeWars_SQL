/*
You manage an e-commerce platform where products have multiple tags. Customers can select several tags, and the system must return only products that contain all selected tags. The product_tags table consists of a product ID and a tag, and may include duplicate entries.

You need to write a parameterized SQL query as a prepared statement named find_products_by_tags. It must accept one parameter - a dynamic array of tags (text[] using $1) - and return product IDs that match all of these tags, sorted in descending order.

Вы управляете e-commerce платформой, где товары имеют несколько тегов. Покупатель может выбрать сразу несколько тегов, и система должна вернуть только те товары, которые имеют все выбранные теги. Таблица product_tags содержит ID товара и тег и может включать дубликаты.

Необходимо написать параметризованный SQL-запрос в виде подготовленного выражения find_products_by_tags. Он должен принимать один параметр - динамический массив тегов (text[] через $1) - и возвращать ID товаров, которые содержат все эти теги, отсортированные по убыванию.
*/

SELECT product_id
FROM product_tags
WHERE tag = ANY ($1)
GROUP BY product_id
HAVING COUNT(DISTINCT tag) = cardinality($1)
ORDER BY product_id DESC;