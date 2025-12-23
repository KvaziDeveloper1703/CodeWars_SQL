/*
You are given a table spectral_logs with detected atmospheric biosignatures for exoplanets.

A planet (object_id) is considered Earth-like if:
Each of the following must appear at least twice:
    - O2_ABS
    - H2O_VAPOR
    - CH4_TRACE
    - O3_UV_SHIELD
    - CO2_BASELINE

Rules:
    - Extra biosignatures are allowed;
    - All data is from one day.

If all three appear at least once, the planet is excluded:
    - CO2_SUPERDENSE
    - SO2_ACIDITY
    - SULFURIC_CLOUDS
Partial matches do not disqualify.

Output:
    - Return object_id of all Earth-like planets;
    - Sort results in ascending order.

Дана таблица spectral_logs с обнаруженными атмосферными биосигнатурами планет.

Планета (object_id) считается землеподобной, если:
Каждая из следующих должна встречаться минимум 2 раза:
    - O2_ABS
    - H2O_VAPOR
    - CH4_TRACE
    - O3_UV_SHIELD
    - CO2_BASELINE

Правила:
    - Дополнительные сигнатуры разрешены;
    - Все данные за один день.

Планета исключается, если все три присутствуют хотя бы один раз:
    - CO2_SUPERDENSE
    - SO2_ACIDITY
    - SULFURIC_CLOUDS
Частичное совпадение не исключает планету.

Результат:
    - Вернуть object_id всех землеподобных планет;
    - Отсортировать по возрастанию object_id.
*/

WITH counts AS (
    SELECT
        object_id,
        SUM(CASE WHEN signature = 'O2_ABS' THEN 1 ELSE 0 END) AS o2_cnt,
        SUM(CASE WHEN signature = 'H2O_VAPOR' THEN 1 ELSE 0 END) AS h2o_cnt,
        SUM(CASE WHEN signature = 'CH4_TRACE' THEN 1 ELSE 0 END) AS ch4_cnt,
        SUM(CASE WHEN signature = 'O3_UV_SHIELD' THEN 1 ELSE 0 END) AS o3_cnt,
        SUM(CASE WHEN signature = 'CO2_BASELINE' THEN 1 ELSE 0 END) AS co2_cnt,
        MAX(CASE WHEN signature = 'CO2_SUPERDENSE' THEN 1 ELSE 0 END) AS has_co2_super,
        MAX(CASE WHEN signature = 'SO2_ACIDITY' THEN 1 ELSE 0 END) AS has_so2,
        MAX(CASE WHEN signature = 'SULFURIC_CLOUDS' THEN 1 ELSE 0 END) AS has_sulfur_clouds
    FROM spectral_logs
    GROUP BY object_id
)

SELECT object_id
FROM counts
WHERE o2_cnt  >= 2 AND h2o_cnt >= 2 AND ch4_cnt >= 2 AND o3_cnt  >= 2 AND co2_cnt >= 2 AND NOT (has_co2_super = 1 AND has_so2 = 1 AND has_sulfur_clouds = 1)
ORDER BY object_id;