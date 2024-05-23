#Question 1 

SELECT
    ci.course_title,
    ROUND(SUM(sl.minutes_watched)) AS total_minutes_watched
FROM
    student_learning AS sl
JOIN
    course_info ci ON sl.course_id = ci.course_id
GROUP BY
    ci.course_id, ci.course_title
ORDER BY
    total_minutes_watched DESC
    limit 5 ;
    #in this way I found the total minutes watched for every course
    
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
# in this way I found the rating for every single course
#Question 2 

SELECT
    DATE_FORMAT(si.date_registered, '%Y-%m-01') AS registration_month,
    COUNT(DISTINCT si.student_id) AS registered_students_per_month
FROM
    student_info AS si
GROUP BY
    registration_month
ORDER BY
    registration_month;
# In this way I will have the registered student per month

SELECT
    MONTH(si.date_registered) AS month,
    COUNT(DISTINCT sp.student_id) / COUNT(DISTINCT si.student_id) AS fraction_onboarded_students
FROM
    student_info AS si
left JOIN
    student_purchases AS sp ON MONTH(si.date_registered) = MONTH(sp.date_purchased)
GROUP BY
    month
ORDER BY
    month;
    # In this way I will have the fraction onboarded students per month. [takes a few seconds to do the code]
    
    # Question 3 
    
    SELECT
    ROUND(SUM(sl.minutes_watched),1) AS total_minutes_watched_purchased_platform,
    ROUND(AVG(sl.minutes_watched),1) AS avg_minutes_watched_purchased_platform
FROM
    student_purchases AS sp
JOIN
    student_learning AS sl ON sp.student_id = sl.student_id;
#in this way you find the purchased avg and sum min watched 

SELECT
    ROUND(SUM(sl.minutes_watched),1) AS total_minutes_watched,
   ROUND(AVG(sl.minutes_watched),1) AS avg_minutes_watched
FROM
    student_learning AS sl
LEFT JOIN
    student_purchases AS sp ON sl.student_id = sp.student_id
WHERE
    sp.student_id IS NULL; 
    
#in this way you find the free avg and sum min watched
    # Question 4
    
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
    
    # Question 5
    
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
