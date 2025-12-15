/*
You are working with a database that stores drug dosage records.

Write an SQL query that returns dosage information for each record with the following columns:
    - record_id
    - drug_name
    - drug_amount
    - dose_units

Rules for dose_units:
    - If a secondary unit exists (check_unit_id is not NULL), display units as primary_unit/secondary_unit;
    - If there is no secondary unit, display only the primary unit.

Requirements:
    - Join data from drugs, dose_records, and units.
    - Sort results by:
        - drug_name ascending;
        - record_id ascending.

У вас есть база данных с записями дозировок лекарств.

Необходимо написать SQL-запрос, который выводит для каждой записи:
    - record_id
    - drug_name
    - drug_amount
    - dose_units

Правила для dose_units:
    - Если есть вторичная единица измерения (check_unit_id не NULL), вывести формат основная_единица/вторичная_единица.
    - Если вторичной единицы нет - вывести только основную единицу.

Требования:
    - Использовать таблицы drugs, dose_records и units;
    - Отсортировать результат:
        - по drug_name по возрастанию;
        - по record_id по возрастанию.
*/

SELECT dose_records.record_id, drugs.drug_name, dose_records.drug_amount,
    CASE
        WHEN dose_records.check_unit_id IS NOT NULL THEN
            CONCAT(primary_units.unit_name, '/', secondary_units.unit_name)
        ELSE
            primary_units.unit_name
    END AS dose_units
FROM dose_records
JOIN drugs ON dose_records.drug_id = drugs.drug_id
JOIN units AS primary_units ON dose_records.drug_unit_id = primary_units.unit_id
LEFT JOIN units AS secondary_units ON dose_records.check_unit_id = secondary_units.unit_id
ORDER BY drugs.drug_name ASC, dose_records.record_id ASC;