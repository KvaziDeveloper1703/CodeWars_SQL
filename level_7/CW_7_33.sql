/*
You are given a table named products that stores information about products and their features.

Table: Products
    - product_id (VARCHAR, primary key): Unique identifier of a product;
    - features (VARCHAR(50)): A string consisting of single-character feature codes.

Each character in the features string represents a distinct feature of the product (for example, waterproof, rechargeable, wireless, etc.).

It is guaranteed that:
    - Each character within a single features string is unique;
    - Both uppercase and lowercase letters are allowed;
    - The order of characters in the string is meaningful and must be preserved.

Write an SQL query that:
    - Splits the features string into individual characters;
    - Produces one row per feature for each product;
    - Preserves the original order of the characters in the features string.

Output Requirements:
The result set must contain the following columns:
    - product_id: the product identifier;
    - feature: a single-character feature code.

The output must be sorted:
    - By product_id in ascending order;
    - By the position of the feature within the original features string for each product.

Дана таблица products, содержащая информацию о товарах и их характеристиках.

Таблица: Products
    - product_id (VARCHAR, первичный ключ): уникальный идентификатор товара;
    - features (VARCHAR(50)): строка, состоящая из однобуквенных кодов характеристик.

Каждый символ в поле features обозначает отдельную характеристику товара (например, влагозащита, возможность перезарядки, беспроводная связь и т. д.).

Гарантируется, что:
    - В пределах одного товара символы не повторяются;
    - Допускаются как заглавные, так и строчные буквы;
    - Порядок символов в строке имеет значение и должен сохраняться.

Необходимо написать SQL-запрос, который:
    - Разбивает строку features на отдельные символы;
    - Формирует по одной строке результата на каждую характеристику товара;
    - Сохраняет исходный порядок символов в строке features.

Требования к результату:
Результат запроса должен содержать следующие столбцы:
    - product_id - идентификатор товара;
    - feature - однобуквенный код характеристики.

Результат необходимо отсортировать:
    - По product_id по возрастанию;
    - По порядку следования символов в строке features для каждого товара.
*/

SELECT products.product_id, SUBSTRING(products.features FROM position_index FOR 1) AS feature
FROM products
JOIN GENERATE_SERIES(1, LENGTH(products.features)) AS position_index ON TRUE
ORDER BY products.product_id ASC, position_index ASC;