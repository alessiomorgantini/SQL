-- Calcola la media e la somma dei minuti guardati dagli studenti in base ai mesi
SELECT
    MONTH(sl.date_watched) AS month,
    ROUND(AVG(sl.minutes_watched),1) AS avg_minutes_watched,
    ROUND(SUM(sl.minutes_watched),1) AS total_minutes_watched
FROM
    student_learning AS sl
GROUP BY
    month
ORDER BY
    month;

