SELECT * FROM mban_a33.student_learning;

SELECT count(distinct student_id) FROM mban_a33.student_learning;


SELECT
    ROUND(SUM(sl.minutes_watched),1) AS total_minutes_watched_purchased_platform,
    ROUND(AVG(sl.minutes_watched),1) AS avg_minutes_watched_purchased_platform
FROM
    student_purchases AS sp
JOIN
    student_learning AS sl ON sp.student_id = sl.student_id;

SELECT
    ROUND(SUM(sl.minutes_watched)) AS total_minutes_watched,
   ROUND(AVG(sl.minutes_watched)) AS avg_minutes_watched
FROM
    student_learning sl
LEFT JOIN
    student_purchases sp ON sl.student_id = sp.student_id
WHERE
    sp.student_id IS NULL; -- Solo studenti senza acquisti

