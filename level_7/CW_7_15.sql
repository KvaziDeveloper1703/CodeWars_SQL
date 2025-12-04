/*
Practice SQL fundamentals by working with a simple database — either one you create yourself or this one, filled with Sailor Moon universe data.

Sailorsenshi schema:
    - id
    - senshi_name
    - real_name_jpn
    - school_id
    - cat_id

Cats schema:
    - id
    - name

Schools schema:
    - id
    - school

Return a results table with the following columns: sailor_senshi, real_name, cat, and school.

The output should list every character along with:
    - their high school,
    - their civilian (real) Japanese name,
    - the cat who introduced them to their magical destiny.

Keep in mind:
    - Some senshi were not initiated by a cat guardian - for them, the cat field may be blank;
    - One senshi is not in high school - so the school field may also be blank.

Попрактикуйтесь в основах SQL, создав простую базу данных на знакомую вам тему — или используйте предложенную базу, наполненную сведениями о вселенной Sailor Moon.

Схема таблицы sailorsenshi:
    - id
    - senshi_name
    - real_name_jpn
    - school_id
    - cat_id

Схема таблицы cats:
    - id
    - name

Схема таблицы schools
    - id
    - school

Верните результирующую таблицу со столбцами: sailor_senshi, real_name, cat, school.

В таблице должны быть перечислены все персонажи, включая:
    - их старшую школу,
    - их гражданское японское имя,
    - кота, который открыл им путь к магической судьбе.

Учтите:
    - Некоторые сенши не были посвящены котом - поэтому поле cat может быть пустым;
    - Одна сенши не учится в старшей школе - поэтому поле school также может быть пустым.
*/

SELECT  sailorsenshi.senshi_name AS sailor_senshi,
        sailorsenshi.real_name_jpn AS real_name,
        cats.name AS cat,
        schools.school AS school
FROM sailorsenshi
LEFT JOIN cats ON sailorsenshi.cat_id = cats.id
LEFT JOIN schools ON sailorsenshi.school_id = schools.id;