/*
In the fair realm of Lothlórien, you must prepare a shortlist of candidates for a vacant council position.

To select suitable elves, filter them by their names:
    - choose elves whose firstname contains "tegil" anywhere (they are likely skilled calligraphers), OR
    - elves whose lastname contains "astar" anywhere (they will be faithful to the role).

Elves table columns:
    - firstname
    - lastname

Your output must return a single column called shortlist, which consists of:
    - firstname and lastname concatenated with a space,
    - with the first letter of each name capitalized.

В прекрасном королевстве Лотлориэн вам поручили составить краткий список кандидатов на вакантное место в совете.

Чтобы выбрать подходящих эльфов, используйте их имена:
    - выберите тех, у кого firstname содержит "tegil" в любой части (они, вероятно, хорошие каллиграфы), ИЛИ
    - тех, у кого lastname содержит "astar" в любом месте (они будут верны своей роли).

Таблица elves содержит столбцы:
    - firstname
    - lastname

В результате нужно вернуть один столбец shortlist, который содержит:
    - имя и фамилию, объединённые через пробел,
    - при этом первая буква имени и фамилии должна быть заглавной.
*/

SELECT CONCAT(UPPER(LEFT(firstname, 1)),
                    SUBSTRING(firstname, 2),
                    ' ',
                    UPPER(LEFT(lastname, 1)),
                    SUBSTRING(lastname, 2)
                ) AS shortlist
FROM elves
WHERE firstname LIKE '%tegil%' OR lastname LIKE '%astar%';