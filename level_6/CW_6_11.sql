/*
The city launched a Green Energy Rebate Program where each household may receive only one rebate, identified by house_no + street_name. Because of a bad website UI, some applicants submitted multiple applications from the same address.

Your task is to find all addresses with duplicate applications and return one summary line per address.

Table: energy_rebate_applications:
    - applicant_id;
    - house_no;
    - street_name.

Output: one column audit_note in the format: {N} applications (applicant_ids: ID1, ID2, ...) already filed at {house_no} {street_name}

Sort by:
    - Number of applications DESC;
    - street_name ASC;
    - house_no ASC.

Город запустил программу компенсаций за установку солнечных панелей. Каждое домохозяйство получает только одну компенсацию по адресу (house_no + street_name). Из-за плохого интерфейса на сайте некоторые подали дубликаты.

Нужно найти все адреса с повторными заявками и вывести по одной строке на адрес.

Таблица: energy_rebate_applications:
    - applicant_id;
    - house_no;
    - street_name.

Вывод: одна колонка audit_note в формате: {N} applications (applicant_ids: ID1, ID2, ...) already filed at {house_no} {street_name}

Сортировка:
    - Количество заявок - по убыванию;
    - street_name - по возрастанию;
    - house_no - по возрастанию.
*/

SELECT COUNT(*) || ' applications (applicant_ids: ' || STRING_AGG(applicant_id::text, ', ' ORDER BY applicant_id) || ') already filed at ' || house_no || ' ' || street_name AS audit_note
FROM energy_rebate_applications
GROUP BY house_no, street_name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, street_name ASC, house_no ASC;