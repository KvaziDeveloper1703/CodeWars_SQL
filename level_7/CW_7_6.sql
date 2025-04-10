/*
You are given a table called "years", which contains a list of years in the column "year".
Your task is to determine whether each year is a leap year according to the following rules:
+ A year is a leap year if it is divisible by 4;
+ However, if the year is divisible by 100, it is not a leap year;
+ But if the year is divisible by 400, it is a leap year regardless of rule 2.

For each year in the table, return:
+ year — the year itself;
+ is_leap — a boolean value indicating whether the year is a leap year.

The output should be ordered in ascending order by year.

Вам дана таблица с названием "years", которая содержит список лет в столбце "year".
Ваша задача — определить, является ли каждый год високосным, согласно следующим правилам:
+ Год является високосным, если он делится на 4;
+ Однако если год делится на 100, то он не является високосным;
+ Но если год делится на 400, то он является високосным, несмотря на предыдущее правило.

Для каждого года в таблице необходимо вернуть:
+ year — сам год;
+ is_leap — логическое значение, указывающее, является ли год високосным.

Результат должен быть отсортирован по возрастанию года.

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