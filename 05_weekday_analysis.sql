-- Weekday analysis --

SELECT 
    DAYNAME(date) as day_of_week,
    WEEKDAY(date) as dow_number,
    AVG(donations) as avg_donations,
    SUM(donations) as total_donations,
    COUNT(DISTINCT date) as days_count
FROM blood_staging
GROUP BY WEEKDAY(date), DAYNAME(date)
ORDER BY dow_number;