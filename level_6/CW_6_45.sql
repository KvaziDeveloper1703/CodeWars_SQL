/*
Write an SQL query to list journeys that end at the station named "Hell".

Tables:
    - journey (id, journey_name);
    - stations (id, station_name);
    - journey_stop (journey_id, station_id, sequence_number).

Rules:
    - "Hell" is always the final stop of a journey;
    - Only include journeys whose last station is "Hell";
    - Output the full path (all stops) of such journeys.

Output must contain two columns - journey_name and station_name. The journey_name should be displayed only for the first stop of each journey, while all subsequent stops for the same journey must show NULL in this column. The station_name must be formatted by concatenating the station name with its sequence number in parentheses, using the format station_name (sequence_number).

Order by journey_id ASC, sequence_number ASC.

Напишите SQL-запрос, который выводит маршруты, заканчивающиеся на станции "Hell".

Таблицы:
    - journey (id, journey_name);
    - stations (id, station_name);
    - journey_stop (journey_id, station_id, sequence_number).

Правила:
    - "Hell" всегда является последней станцией маршрута;
    - Нужно выбрать только те маршруты, у которых финальная станция - "Hell";
    - Вывести все остановки таких маршрутов.

Формат вывода должен содержать два столбца: journey_name и station_name. Значение journey_name отображается только для первой остановки каждого маршрута, для всех последующих остановок выводится NULL. Поле station_name должно быть отформатировано как station_name (sequence_number).

Сортировка:
    - По journey_id по возрастанию;
    - Затем по sequence_number по возрастанию.
*/

WITH hell_journeys AS (
    SELECT journey.id AS journey_id
    FROM journey
    JOIN journey_stop ON journey_stop.journey_id = journey.id
    JOIN stations ON stations.id = journey_stop.station_id
    GROUP BY journey.id
    HAVING
        MAX(journey_stop.sequence_number) = MAX(
            CASE
                WHEN stations.station_name = 'Hell'
                THEN journey_stop.sequence_number
            END
        )
),
ordered_stops AS (
    SELECT journey.id AS journey_id, journey.journey_name, stations.station_name, journey_stop.sequence_number,
        ROW_NUMBER() OVER (
            PARTITION BY journey.id
            ORDER BY journey_stop.sequence_number
        ) AS stop_order
    FROM journey
    JOIN hell_journeys ON hell_journeys.journey_id = journey.id
    JOIN journey_stop ON journey_stop.journey_id = journey.id
    JOIN stations ON stations.id = journey_stop.station_id
)
SELECT
    CASE
        WHEN stop_order = 1 THEN journey_name
        ELSE NULL
    END AS journey,
    station_name || ' (' || sequence_number || ')' AS station_name
FROM ordered_stops
ORDER BY journey_id, sequence_number;