/*
Write a query that takes a table "disemvowel" with one column "str" and returns a new table where:
+ str - contains the original strings from the input table;
+ res - contains the strings with all vowels removed.

Написать запрос, который принимает таблицу "disemvowel" с одним столбцом "str" и возвращает новую таблицу, где:
+ str - содержит исходные строки из входной таблицы;
+ res - содержит строки, из которых удалены все гласные.

https://www.codewars.com/kata/52fba66badcd10859f00097e
*/

SELECT 
    str,
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    str, 
                                                    'a', ''
                                                ), 
                                                'e', ''
                                            ), 
                                            'i', ''
                                        ), 
                                        'o', ''
                                    ), 
                                    'u', ''
                                ), 
                                'A', ''
                            ), 
                            'E', ''
                        ), 
                        'I', ''
                    ), 
                    'O', ''
                ), 
                'U', ''
            ),
            'y', ''
        ),
        'Y', ''
    ) AS res
FROM disemvowel;