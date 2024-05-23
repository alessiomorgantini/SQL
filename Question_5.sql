SELECT
    student_info.student_country,
    COUNT(DISTINCT student_info.student_id) AS registered_students,
    ROUND(SUM(student_learning.minutes_watched),1) AS total_minutes_watched
FROM
    student_info
LEFT JOIN
    student_learning ON student_info.student_id = student_learning.student_id
GROUP BY
    student_info.student_country
ORDER BY
    total_minutes_watched DESC;

-- Calcola il numero di studenti registrati, la somma e la media dei minuti guardati per ogni paese
SELECT
    student_info.student_country,
    COUNT(DISTINCT student_info.student_id) AS registered_students,
    ROUND(SUM(student_learning.minutes_watched),1) AS total_minutes_watched,
    ROUND(AVG(student_learning.minutes_watched),1) AS avg_minutes_watched
FROM
    student_info
LEFT JOIN
    student_learning ON student_info.student_id = student_learning.student_id
GROUP BY
    student_info.student_country
ORDER BY
    registered_students DESC;
