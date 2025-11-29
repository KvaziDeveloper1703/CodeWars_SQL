/*
You must find which data entry specialists made the most name-typo errors in certification records.

Consider only certifications where Levenshtein(employees.name, cert_name) is between 1 and 3.

Output per specialist:
    - specialist_id;
    - error_count - number of such typo records;
    - error_percentage - (error_count / total_errors) * 100, rounded to 2 decimals, as varchar.

Order:
    - error_count DESC;
    - specialist_id ASC.

Нужно определить, какие специалисты сделали больше всего опечаток в именах в сертификатах.

Берём записи, где Levenshtein(name, cert_name) = 1–3.

Вывести по каждому специалисту:
- specialist_id;
- error_count - количество таких ошибок;
- error_percentage - процент от всех ошибок (2 знака, строкой).

Сортировка:
    - error_count по убыванию;
    - specialist_id по возрастанию.
*/

WITH certification_typo_errors AS ( SELECT certifications.entered_by AS specialist_id
                                    FROM certifications
                                    JOIN employees ON employees.id = certifications.employee_id
                                    WHERE levenshtein(employees.name, certifications.cert_name) BETWEEN 1 AND 3
                                ),
total_error_count AS (  SELECT COUNT(*) AS total_number_of_errors
                        FROM certification_typo_errors
                    )
SELECT certification_typo_errors.specialist_id, COUNT(*) AS error_count, TO_CHAR( ROUND( (COUNT(*)::decimal / total_error_count.total_number_of_errors) * 100, 2), 'FM999990.00') AS error_percentage
FROM certification_typo_errors
CROSS JOIN total_error_count
GROUP BY certification_typo_errors.specialist_id, total_error_count.total_number_of_errors
ORDER BY error_count DESC, certification_typo_errors.specialist_id ASC;