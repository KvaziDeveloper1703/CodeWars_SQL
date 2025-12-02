/*
A customer service phone system uses a voice-recognition bot, and all calls are logged in a PostgreSQL database. Some callers get transferred to a human representative when they become too angry, and the system detects this when the transcription contains the phrase “F-word” three or more times. You need to determine which hours of the day see the most such escalated calls.

You must write a SQL query that analyzes the calls and transcriptions tables. The query should extract individual words from each transcription even when punctuation or multiple spaces are present, count how many times “F-word” appears in each transcription, and identify calls that were transferred to a representative and contain the phrase at least three times. Then you must group these calls by the hour of the timestamp and count how many such angry calls occurred each hour. The final report lists the hour and the number of angry calls, sorted first by the count in descending order and then by the hour in ascending order.

Based on the example data, the output shows the peak hours when callers used “F-word” frequently enough to trigger a transfer.

Система обслуживания клиентов использует голосового бота, и все звонки сохраняются в базе PostgreSQL. Некоторые звонки переводятся на живого оператора, если клиент слишком злится, и система определяет это по тому, что в расшифровке содержится фраза “F-word” три и более раз. Нужно выяснить, в какие часы суток такие эскалации происходят чаще всего.

Требуется написать SQL-запрос, который анализирует таблицы calls и transcriptions. Запрос должен корректно извлекать слова из расшифровок даже при наличии пунктуации и лишних пробелов, подсчитывать количество вхождений “F-word” в каждой расшифровке, отбирать только те звонки, которые были переведены к оператору и содержат фразу минимум три раза, а затем сгруппировать эти звонки по часу из метки времени и посчитать их количество. Итоговый отчёт должен содержать час дня и число таких звонков, отсортированных сначала по убыванию количества, а при равенстве - по возрастанию часа.

На основе примера формируется список часов с наибольшим количеством “сердитых” звонков.
*/

WITH cleaned_transcriptions AS (
    SELECT
        transcriptions.call_id,
        regexp_split_to_table(
            regexp_replace(
                content,
                '[!"#$%&''()*+,./:;<=>?@[\\\]^_`{|}~]',
                ' ',
                'g'
            ),
            '\s+'
        ) AS word
    FROM transcriptions
),
fword_counts AS (
    SELECT
        call_id,
        COUNT(*) AS fword_count
    FROM cleaned_transcriptions
    WHERE LOWER(word) = 'f-word'
    GROUP BY call_id
),
angry_calls AS (
    SELECT
        calls.call_id,
        EXTRACT(HOUR FROM calls.timestamp) AS call_hour
    FROM calls
    JOIN fword_counts
        ON calls.call_id = fword_counts.call_id
    WHERE
        calls.status = 'transferred_to_rep'
        AND fword_counts.fword_count >= 3
)
SELECT
    call_hour::FLOAT AS call_hour,
    COUNT(*)::INT AS angry_call_count
FROM angry_calls
GROUP BY call_hour
ORDER BY angry_call_count DESC, call_hour ASC;