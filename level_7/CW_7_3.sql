/*
Write a query for a table "dnastrand" with a column "dna". Return the original column "dna" and a new column "res" containing the complementary DNA strand:
+ "A" ↔ "T"
+ "C" ↔ "G"

Напишите запрос для таблицы "dnastrand" с колонкой "dna". Верните колонку "dna" и новую колонку "res" с комплементарной цепью ДНК:
+ "A" ↔ "T"
+ "C" ↔ "G"

https://www.codewars.com/kata/554e4a2f232cdd87d9000038
*/

SELECT
    dna,
    UPPER(REPLACE(
            REPLACE(
              REPLACE(
                REPLACE(dna, 'A', 'T'), 
              'T', 'A'), 
            'C', 'G'), 
          'G', 'C')) AS res
FROM dnastrand;