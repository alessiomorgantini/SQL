SELECT
    ci.course_title,
    ROUND(SUM(sl.minutes_watched)) AS total_minutes_watched
FROM
    student_learning sl
JOIN
    course_info ci ON sl.course_id = ci.course_id
GROUP BY
    ci.course_id, ci.course_title
ORDER BY
    total_minutes_watched DESC;


SELECT
    ci.course_title AS course_name,
    ROUND(AVG(cr.course_rating),1) AS avg_course_rating
FROM
    course_info AS ci
JOIN
    course_ratings cr ON ci.course_id = cr.course_id
GROUP BY
    ci.course_id, ci.course_title
    ORDER BY avg_course_rating DESC;



