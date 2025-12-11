/*
You are a German police officer, and the graphical system for managing speeding records is temporarily unavailable. Since you have some database experience, you need to manually write an SQL query.

Select each person’s ID and birthdate. For every person, calculate the total sum of their speed deltas from all speeding records. If a person has no records, the total should be 0.
The result must include all people and must be ordered by person_id in ascending order.

The output should contain:
    - person_id - the ID of the person;
    - birthdate - their birthdate;
    - total_speed_delta - the sum of all their speed deltas.

Вы - немецкий офицер полиции, и система управления записями о превышении скорости временно недоступна. Поскольку у вас есть опыт работы с базами данных, нужно вручную написать SQL-запрос.

Необходимо выбрать ID и дату рождения каждого человека. Для каждого человека посчитать сумму всех его превышений скорости. Если у человека нет записей, нужно вернуть 0.
Результат должен включать всех людей и быть отсортирован по person_id по возрастанию.

Вывод должен содержать:
    - person_id - идентификатор человека;
    - birthdate - его дата рождения;
    - total_speed_delta - сумма всех превышений скорости.
*/

SELECT  People.id AS person_id,
        People.birthdate AS birthdate,
        COALESCE(SUM(Records.speed_delta), 0) AS total_speed_delta
FROM People
LEFT JOIN Records ON People.id = Records.person_id
GROUP BY People.id, People.birthdate
ORDER BY person_id ASC;