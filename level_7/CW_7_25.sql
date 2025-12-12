/*
You are working with a PostgreSQL table called interview_failures, which stores the reasons candidates failed their interviews.

The table contains:
    - candidate_name - name of the candidate;
    - failure_reason - explanation of why the interview was failed;
    - interview_date - date of the interview.

Your task is to calculate how many interview failures occurred for each failure_reason, but without using COUNT() and without relying on any ID column.

The query must return:
    - failure_reason - the reason;
    - cnt - how many candidates failed for that reason.

Sort the results by:
    - cnt in descending order
    - failure_reason alphabetically, if counts are equal

У вас есть таблица PostgreSQL interview_failures, которая хранит причины, по которым кандидаты провалили собеседование.

Таблица содержит:
    - candidate_name - имя кандидата;
    - failure_reason - причина провала;
    - interview_date - дата собеседования.

Нужно определить, сколько раз встречается каждая failure_reason, при этом нельзя использовать COUNT() и нельзя опираться на автоинкрементный id.

Запрос должен выводить:
    - failure_reason - причину;
    - cnt - количество кандидатов, проваливших по этой причине.

Сортировка:
    - по cnt по убыванию;
    - по failure_reason в алфавитном порядке при равных значениях.
*/

SELECT interview_failures.failure_reason, SUM(1) AS cnt
FROM interview_failures
GROUP BY interview_failures.failure_reason
ORDER BY cnt DESC, interview_failures.failure_reason ASC;