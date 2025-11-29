/*
You need to compare inventory records between two dates to find which product/size combinations were added or removed.

Table: inventory:
    - id;
    - product_id;
    - product_size;
    - inventory_date.

Write a parameterized SQL query that takes two dates and returns:
    - Items removed → present on $1 but not on $2;
    - Items added → present on $2 but not on $1.

Output columns:
    - product_id;
    - product_size;
    - change_type.

Sort by:
    - product_id DESC;
    - product_size ASC.

Only compare the two given dates; ignore all others.

Нужно сравнить инвентаризацию за две даты и определить, какие товары/размеры были добавлены или удалены.

Таблица inventory:
    - id;
    - product_id;
    - product_size;
    - inventory_date.

Напишите параметризованный SQL-запрос, который принимает две даты и выводит:
    - removed - есть в $1, отсутствует в $2;
    - added - есть в $2, отсутствует в $1.

Вывести:
    - product_id;
    - product_size;
    - change_type.

Сортировка:
    - product_id по убыванию;
    - product_size по возрастанию.

Сравнивать нужно только две переданные даты, остальные записи игнорируются.
*/

PREPARE find_inventory_changes(date, date) AS
WITH inventory_on_earlier_date AS ( SELECT product_id, product_size
                                    FROM inventory
                                    WHERE inventory_date = $1
                                ),
inventory_on_later_date AS (SELECT product_id, product_size
                            FROM inventory
                            WHERE inventory_date = $2
                        ),
removed_products AS (   SELECT earlier.product_id, earlier.product_size, 'removed' AS change_type
                        FROM inventory_on_earlier_date earlier
                        LEFT JOIN inventory_on_later_date later
                        ON later.product_id = earlier.product_id
                        AND later.product_size = earlier.product_size
                        WHERE later.product_id IS NULL
                ),
added_products AS ( SELECT later.product_id, later.product_size, 'added' AS change_type
                    FROM inventory_on_later_date later
                    LEFT JOIN inventory_on_earlier_date earlier
                    ON earlier.product_id = later.product_id
                    AND earlier.product_size = later.product_size
                    WHERE earlier.product_id IS NULL
                )
SELECT product_id, product_size, change_type
FROM (  SELECT * FROM removed_products
        UNION ALL
        SELECT * FROM added_products
    ) AS combined_changes
ORDER BY product_id DESC, product_size ASC;