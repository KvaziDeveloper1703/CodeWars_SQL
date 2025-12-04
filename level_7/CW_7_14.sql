/*
It’s time to determine which fighters will advance to the 6 available spots in the semi-finals of the Street Fighter World Fighting Championship. Every fight throughout the year has been recorded, and each fighter’s wins and losses must be totaled.

The fighters table records, for each match, the fighter’s name, whether they won (1) or lost (0), and the move that ended the bout.

Fighters table:
    - id
    - name
    - won
    - lost
    - move_id

Winning_moves table:
    - id
    - move

Due to new safety rules, all ki blasts are banned as a fire hazard. Any match that ended with Hadoken, Shouoken, or Kikoken must NOT be counted toward total wins or losses.

Your task:
    - Return name, won, and lost, where won/lost are the total number of wins and losses for each fighter;
    - Do not count any win or loss where the winning move was Hadoken, Shouoken, or Kikoken;
    - Group results by the fighter’s name;
    - Order results by most wins first;
    - Return only the top 6 fighters.

Пришло время определить, какие бойцы пройдут в 6 заветных мест полуфинала чемпионата Street Fighter World Fighting Championship. Все бои года записаны, и необходимо подсчитать победы и поражения каждого бойца.

Таблица fighters содержит для каждого боя имя бойца, информацию о победе (1) или поражении (0), а также приём, которым закончился бой.

Таблица fighters:
    - id
    - name
    - won
    - lost
    - move_id

Таблица winning_moves:
    - id
    - move

Из-за новых требований безопасности все ки-взрывы запрещены как пожароопасные. Бои, завершившиеся приёмами Hadoken, Shouoken или Kikoken, не должны учитываться в подсчёте побед и поражений.

Твоя задача:
    - Вернуть столбцы name, won, lost, где won и lost - общее количество побед и поражений каждого бойца;
    - Не учитывать бои, где победный приём - Hadoken, Shouoken или Kikoken;
    - Сгруппировать результаты по name;
    - Отсортировать от наибольшего количества побед к наименьшему;
    - Вернуть только топ-6 бойцов.
*/

SELECT  fighters.name,
        SUM(fighters.won) AS won,
        SUM(fighters.lost) AS lost
FROM fighters
JOIN winning_moves ON fighters.move_id = winning_moves.id
WHERE winning_moves.move NOT IN ('Hadoken', 'Shouoken', 'Kikoken')
GROUP BY fighters.name
ORDER BY won DESC
LIMIT 6;