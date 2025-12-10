/*
There is no real magic in the world - the Hogwarts Sorting Hat is actually SQL-based.
Its decision-making powers come from basic SQL operators, and prospective students are just data with a name and two qualities.

Students table schema:
    - id
    - name
    - quality1
    - quality2

The sorting rules:
    - Slytherin accepts students who are evil AND cunning;
    - Gryffindor accepts students who are brave, but only if their second quality is NOT evil;
    - Ravenclaw accepts students who are studious OR intelligent;
    - Hufflepuff accepts anyone who has the quality hufflepuff.

Return the id, name, quality1, and quality2 of all students who get accepted, ordered by ascending id.

В мире нет настоящей магии - Распределяющая шляпа Хогвартса работает на SQL.
Её решения основаны на обычных операторах SQL, а будущие ученики - это просто данные: имя и два качества.

Схема таблицы students:
    - id
    - name
    - quality1
    - quality2

Правила распределения:
    - Слизерин принимает учеников, которые злыe И хитрые;
    - Гриффиндор принимает учеников, которые смелые, но только если их второе качество НЕ злое;
    - Когтевран принимает учеников, которые прилежные ИЛИ умные;
    - Пуффендуй принимает всех, у кого есть качество hufflepuff.

Верните id, name, quality1 и quality2 всех принятых учеников, отсортированных по возрастанию id.
*/

SELECT id, name, quality1, quality2
FROM students
WHERE (quality1 = 'evil' AND quality2 = 'cunning')
   OR (quality1 = 'brave' AND quality2 <> 'evil')
   OR (quality1 = 'studious' OR quality2 = 'intelligent')
   OR (quality1 = 'hufflepuff' OR quality2 = 'hufflepuff')
ORDER BY id;