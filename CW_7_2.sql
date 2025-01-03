/*
Imagine "trolls" are attacking your comment section! A common way to deal with this situation is to remove all vowels from their comments, neutralizing the threat.

Your task is to write an SQL query that takes a table disemvowel with one column str and returns a new table where:
+ str contains the original strings from the input table.
+ res contains the strings with all vowels removed.

For this task, vowels are considered to be a, e, i, o, and u (but not y).
Example: 
Input:
A table disemvowel with a column str containing the string "This website is for losers LOL!"

Output:
A table with columns:
+ str: "This website is for losers LOL!"
+ res: "Ths wbst s fr lsrs LL!"

Представьте, что "тролли" атакуют ваш раздел комментариев! Один из способов справиться с этой ситуацией — удалить все гласные из их комментариев, нейтрализуя угрозу.

Ваша задача — написать SQL-запрос, который принимает таблицу disemvowel с одним столбцом str и возвращает новую таблицу, где:
+ str содержит исходные строки из входной таблицы.
+ res содержит строки, из которых удалены все гласные.

Для этой задачи гласными считаются только a, e, i, o, u (буква y не считается гласной).
Пример: 
Вход:
Таблица disemvowel с колонкой str, содержащей строку "This website is for losers LOL!"

Выход:
Таблица с колонками:
+ str: "This website is for losers LOL!"
+ res: "Ths wbst s fr lsrs LL!"

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
    ) AS res
FROM disemvowel;