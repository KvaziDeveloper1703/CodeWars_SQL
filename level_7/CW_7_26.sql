/*
To celebrate the anniversary of ABC Kata Solutions, we take a closer look at the backbone of the company - its longest-serving active employees.

Your task is to write an SQL query that reveals a hidden code. This code is obtained by summing the ASCII values of the first letters of the last names of the five longest-tenured employees who are still working at the company.

You are given an employees table with the following structure:
    - id (integer) - unique employee identifier;
    - name (string) - employee full name in the format "FirstName LastName";
    - joined_date (date) - date the employee joined the company;
    - left_date (date, nullable) - date the employee left the company (NULL if still employed).

Requirements:
    - Select current employees only: Include only employees whose left_date is NULL;
    - Find the top 5 longest-tenured employees: Order employees by joined_date from oldest to newest and select the first five;
    - Extract the first letter of each last name: From the name field, extract the first character of the last name;
    - Convert letters to ASCII values: Use the ASCII value of each extracted character;
    - Calculate the hidden code: Sum all ASCII values;
    - Output the result: Return a single column named hidden_code.

В честь годовщины компании ABC Kata Solutions мы обращаем внимание на её основу - сотрудников, которые работают в компании дольше всего и продолжают вносить вклад в её развитие.

Вам необходимо написать SQL-запрос, который вычисляет скрытый код. Этот код получается путём суммирования ASCII-кодов первых букв фамилий пяти самых «старых» по дате приёма сотрудников, которые до сих пор работают в компании.

Дана таблица employees со следующими полями:
    - id (integer) - уникальный идентификатор сотрудника;
    - name (string) - полное имя в формате "Имя Фамилия";
    - joined_date (date) - дата приёма на работу;
    - left_date (date, nullable) - дата увольнения (NULL, если сотрудник всё ещё работает).

Требования:
    - Выбрать только действующих сотрудников: Учитываются только записи, где left_date IS NULL;
    - Определить 5 сотрудников с самым большим стажем: Отсортировать по joined_date по возрастанию и взять первые пять строк;
    - Извлечь первую букву фамилии: Из поля name получить первую букву фамилии;
    - Преобразовать буквы в ASCII-коды;
    - Вычислить скрытый код: Сложить все полученные ASCII-значения;
    - Вернуть результат: Результат должен содержать один столбец с названием hidden_code.
*/

SELECT SUM(ASCII(SUBSTRING(name FROM POSITION(' ' IN name) + 1 FOR 1))) AS hidden_code
FROM (  SELECT name
        FROM employees
        WHERE left_date IS NULL
        ORDER BY joined_date
        LIMIT 5
) AS oldest_employees;