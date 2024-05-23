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
    





