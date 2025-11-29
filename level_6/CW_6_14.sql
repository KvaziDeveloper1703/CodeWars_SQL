/*
You must calculate how many active bookings exist for each booking_date.

Table: course_bookings:
    - id;
    - course_id;
    - user_id;
    - course_start_date;
    - booking_date.

Definition: active booking:
A booking is active on a given booking_date if:
    - It was booked on or before that booking_date;
    - Its course_start_date is on or after that booking_date.

Required output:
For every booking_date in the table:
    - booking_date;
    - active_bookings - count of all active bookings on that date.

Sort ascending by booking_date.

Нужно посчитать, сколько активных бронирований существует на каждую booking_date.

Таблица: course_bookings:
    - id;
    - course_id;
    - user_id;
    - course_start_date;
    - booking_date.

Определение: активное бронирование:
Бронирование считается активным на дату X, если:
    - Оно было сделано в этот день или раньше;
    - Дата начала курса в этот день или позже.

Что вывести:
Для каждой booking_date:
    - booking_date;
    - active_bookings - количество активных бронирований.

Сортировка по booking_date по возрастанию.
*/

SELECT booking_dates.booking_date, COUNT(bookings.id) AS active_bookings
FROM (  SELECT DISTINCT booking_date 
        FROM course_bookings) AS booking_dates
LEFT JOIN course_bookings AS bookings   ON bookings.booking_date <= booking_dates.booking_date
                                        AND bookings.course_start_date >= booking_dates.booking_date
GROUP BY booking_dates.booking_date
ORDER BY booking_dates.booking_date ASC;