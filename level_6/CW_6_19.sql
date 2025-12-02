/*
A city police department is analyzing surveillance data from traffic lights to investigate a criminal syndicate suspected of using specific vehicles. Every vehicle passing a traffic light is logged with a timestamp, type, and traffic light ID. Detectives are especially interested in sightings of “black bmw” at traffic_light_id = 1 and want to identify the vehicles that appear immediately before and after each such sighting.

Your task is to query the traffic_observations table and return the types of the nearest neighboring vehicles around every “black bmw” at traffic_light_id = 1. Only vehicles from the same traffic light and with the closest earlier or later timestamp should be considered. The output must list the vehicle type and how many times it appears as a neighbor. Results should be sorted first by this count in descending order, and then alphabetically if counts match.

Consecutive “black bmw” entries should be treated normally, and each event contributes separately to the counts. Timestamps are unique within a traffic light. Based on the sample data, the expected output shows the most frequent neighboring vehicle types around “black bmw” sightings.

Полиция города изучает данные с камер наблюдения на перекрёстках, чтобы расследовать деятельность преступной группировки, использующей определённые автомобили. Каждое транспортное средство фиксируется с указанием времени, типа и ID светофора. Особый интерес вызывает появление “black bmw” на светофоре с ID = 1, и необходимо определить машины, которые проходят сразу до и сразу после каждого такого появления.

Нужно выполнить запрос к таблице traffic_observations, чтобы получить типы ближайших соседних автомобилей вокруг каждого “black bmw” на traffic_light_id = 1. Учитываются только записи с того же светофора и с ближайшими по времени метками - одна раньше, одна позже. В отчёте должны быть указаны тип автомобиля и количество раз, когда он встречается в роли соседа. Сортировка - по количеству по убыванию, а при равенстве - по названию типа по алфавиту.

Последовательные “black bmw” обрабатываются как обычные записи, каждая даёт свой вклад в статистику. В пределах одного светофора временные метки уникальны. На основе примера формируется итоговая таблица с наиболее частыми соседними типами транспортных средств.
*/

WITH filtered AS (
    SELECT *
    FROM traffic_observations
    WHERE traffic_light_id = 1
),
black_bmw_events AS (
    SELECT id, datetime
    FROM filtered
    WHERE type = 'black bmw'
),
nearest_before AS (
    SELECT
        black_bmw_events.id AS bmw_id,
        filtered.type AS neighbour_type
    FROM black_bmw_events
    LEFT JOIN LATERAL (
        SELECT type
        FROM filtered
        WHERE datetime < black_bmw_events.datetime
        ORDER BY datetime DESC
        LIMIT 1
    ) AS filtered ON TRUE
    WHERE filtered.type IS NOT NULL
),
nearest_after AS (
    SELECT
        black_bmw_events.id AS bmw_id,
        filtered.type AS neighbour_type
    FROM black_bmw_events
    LEFT JOIN LATERAL (
        SELECT type
        FROM filtered
        WHERE datetime > black_bmw_events.datetime
        ORDER BY datetime ASC
        LIMIT 1
    ) AS filtered ON TRUE
    WHERE filtered.type IS NOT NULL
),
all_neighbours AS (
    SELECT neighbour_type FROM nearest_before
    UNION ALL
    SELECT neighbour_type FROM nearest_after
)
SELECT
    neighbour_type AS type_neighbour,
    COUNT(*) AS count
FROM all_neighbours
GROUP BY neighbour_type
ORDER BY count DESC,
         neighbour_type ASC;