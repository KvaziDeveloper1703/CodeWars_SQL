/*
You work for a sports analytics company that stores race results in a PostgreSQL database with tables for runners, runs, and races. Your goal is to write a SQL query that returns all races in which runner with runner_id = 1 participated. The result must include the runner’s name, their run ID, their finishing position, the race ID, and an additional column that shows either the second-place runner (if runner 1 won the race) or the winner of that race (if runner 1 did not win). The name must be shown together with the runner_id in the format name (id). The output should be sorted by the race date in ascending order.

Given sample data, the expected result shows John Runner’s runs together with the correct competitor (either the winner or second-place runner depending on his position).

Вы работаете в компании спортивной аналитики, которая хранит результаты забегов в базе PostgreSQL с таблицами бегунов, забегов и гонок. Нужно составить SQL-запрос, который выводит все гонки, в которых участвовал бегун с runner_id = 1. В результат должны входить имя бегуна, ID его забега, занятое место, ID гонки и дополнительный столбец, где отображается либо бегун, занявший второе место (если runner 1 победил), либо победитель гонки (если runner 1 не был первым). Имя нужно выводить вместе с идентификатором в формате имя (id). Итоговые строки должны быть отсортированы по дате гонки по возрастанию.

На основе примера данные должны дать вывод с участием John Runner и правильным отображением его соперников.
*/

SELECT
    runners.name AS runner_name,
    runs.run_id,
    runs.position,
    races.race_id,
    CASE 
        WHEN runs.position = 1 THEN
            (
                SELECT other_runners.name || ' (' || other_runs.runner_id || ')'
                FROM runners AS other_runners
                JOIN runs AS other_runs
                    ON other_runs.runner_id = other_runners.runner_id
                WHERE other_runs.race_id = runs.race_id
                  AND other_runs.position = 2
            )
        ELSE
            (
                SELECT other_runners.name || ' (' || other_runs.runner_id || ')'
                FROM runners AS other_runners
                JOIN runs AS other_runs
                    ON other_runs.runner_id = other_runners.runner_id
                WHERE other_runs.race_id = runs.race_id
                  AND other_runs.position = 1
            )
    END AS "win/second"
FROM runners
JOIN runs
    ON runs.runner_id = runners.runner_id
JOIN races
    ON races.race_id = runs.race_id
WHERE runners.runner_id = 1
ORDER BY races.date ASC;