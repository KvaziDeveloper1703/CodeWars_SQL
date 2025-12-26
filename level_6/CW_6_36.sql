/*
You are given a table assembly_log that records events of a manufacturing process.

Table structure:
    - id - unique row identifier, increasing with time;
    - process_id - identifier of the process;
    - event - event type (Start, stage names, or Ignore);
    - value - temperature value (integer).

Definitions:
    - A batch is a sequence of rows starting with Start and ending right before the next Start within the same process_id;
    - Each process_id has its own independent batches;
    - Events with event = 'Ignore' must not be included in calculations;
    - Start events do participate in temperature calculations.

For each batch:
    - Identify batches using Start events;
    - Assign a sequential batch_id, starting from 1 for each process_id;
    - Calculate temperature fluctuation as: max(value) − min(value).

Output:
    - process_id
    - batch_id
    - temperature_fluctuation

Sorting: Order results by process_id ASC, then batch_id ASC.

Вам дана таблица assembly_log, которая содержит события производственного процесса.

Структура таблицы:
    - id - уникальный идентификатор строки, возрастающий со временем;
    - process_id - идентификатор процесса;
    - event - тип события (Start, названия этапов или Ignore);
    - value - значение температуры.

Определения:
    - Партия - это последовательность строк, начинающаяся с события Start и заканчивающаяся непосредственно перед следующим событием Start в рамках одного process_id;
    - Для каждого process_id партии определяются независимо;
    - События с event = 'Ignore' не должны учитываться в расчётах;
    - События Start участвуют в расчётах температуры.

Для каждой партии необходимо:
    - Определить границы партий на основе событий Start;
    - Присвоить последовательный batch_id, начиная с 1 для каждого process_id;
    - Вычислить температурное колебание по формуле: max(value) − min(value).

Результат должен содержать:
    - process_id
    - batch_id
    - temperature_fluctuation

Сортировка:
    - Сначала по process_id по возрастанию,
    - Затем по batch_id по возрастанию.
*/

WITH batch_marking AS (
    SELECT id, process_id, event, value, 
        SUM(
            CASE WHEN event = 'Start' THEN 1 ELSE 0 END
        ) OVER (
            PARTITION BY process_id
            ORDER BY id
            ROWS UNBOUNDED PRECEDING
        ) AS batch_id
    FROM assembly_log
),
filtered AS (
    SELECT process_id, batch_id, value
    FROM batch_marking
    WHERE event <> 'Ignore'
)
SELECT process_id, batch_id, MAX(value) - MIN(value) AS temperature_fluctuation
FROM filtered
GROUP BY process_id, batch_id
ORDER BY process_id, batch_id;