/*
You should simply determine whether a given year is a leap year or not.

Leap year rules:
+ A year divisible by 4 → is a leap year;
+ BUT a year divisible by 100 → is NOT a leap year;
+ BUT a year divisible by 400 → is a leap year.

Tested years are in the range 1600 ≤ year ≤ 4000.

Вам нужно определить, является ли заданный год високосным или нет.

Правила определения високосного года:
+ Год делится на 4 → високосный;
+ НО если год делится на 100, то он не високосный;
+ НО если год делится на 400, то он всё же високосный.

Годы находятся в диапазоне 1600 ≤ год ≤ 4000.

https://www.codewars.com/kata/526c7363236867513f0005ca
*/

SELECT 
    year,
    CASE 
        WHEN year % 400 = 0 THEN true
        WHEN year % 100 = 0 THEN false
        WHEN year % 4 = 0 THEN true
        ELSE false
    END AS is_leap
FROM years
ORDER BY year ASC;