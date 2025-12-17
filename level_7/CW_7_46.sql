/*
You are given a database table named host_software, which contains information about software installations on host machines.

Table structure:
    - id (integer) - primary key;
    - host (varchar) - name of the host machine;
    - software_title (varchar) - name of the installed software;
    - install_date (date) - date when the software was installed.

Write a SQL query that identifies host machines missing the software titled "Title2".

Requirements:
    - The query must return only the names of the hosts;
    - A host should be included only if it does not have "Title2" installed;
    - Hosts that have no software installations within the last year should be excluded from the results;
        - A software installation is considered recent if its install_date is within the last year including the current date;
        - Installations made exactly one year ago from today are considered recent.
    - If all software installations for a host are older than one year, that host must not appear in the result set;
    - The result must contain a single column named host;
    - The output should be sorted alphabetically in ascending order.

Дана таблица базы данных host_software, содержащая информацию об установленных программах на хост-машинах.

Структура таблицы:
    - id (integer) - первичный ключ;
    - host (varchar) - имя хост-машины;
    - software_title (varchar) - название установленного программного обеспечения;
    - install_date (date) - дата установки программного обеспечения.

Напишите SQL-запрос, который определяет хост-машины, на которых отсутствует программное обеспечение с названием "Title2".

Требования:
    - Запрос должен возвращать только имена хостов;
    - В результат должны попадать только те хосты, на которых не установлено "Title2";
    - Необходимо исключить хосты, у которых нет ни одной установки программ за последний год;
        - Установка считается актуальной, если её дата находится в пределах одного года от текущей даты включительно;
        - Установки, выполненные ровно год назад, также считаются актуальными.
    - Если все установки программ на хосте старше одного года, такой хост не должен попадать в результат;
    - Результат должен содержать один столбец host;
    - Результат должен быть отсортирован по алфавиту в порядке возрастания.
*/

SELECT host_software.host
FROM host_software
GROUP BY host_software.host
HAVING
    SUM(
        CASE
            WHEN host_software.software_title = 'Title2' THEN 1
            ELSE 0
        END
    ) = 0
    AND MAX(host_software.install_date) >= CURRENT_DATE - INTERVAL '1 year'
ORDER BY host_software.host ASC;