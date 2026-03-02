-- Yearly summary statistics --

SELECT 
    YEAR(date) as year,
    COUNT(DISTINCT date) as active_days,
    SUM(donations) as total_donations,
    ROUND(AVG(donations), 2) as avg_daily_donations,
    ROUND(STDDEV(donations), 2) as std_dev_donations,
    MAX(donations) as max_daily_donation,
    MIN(donations) as min_daily_donation,
    SUM(donations) - LAG(SUM(donations)) OVER(ORDER BY YEAR(date)) as yoy_change,
    CASE 
        WHEN LAG(SUM(donations)) OVER(ORDER BY YEAR(date)) > 0 
        THEN ROUND((SUM(donations) - LAG(SUM(donations)) OVER(ORDER BY YEAR(date))) * 100.0 / 
             LAG(SUM(donations)) OVER(ORDER BY YEAR(date)), 2)
        ELSE NULL
    END as yoy_growth_percentage
FROM blood_staging
WHERE YEAR(date) BETWEEN 2020 AND 2026
GROUP BY YEAR(date)
ORDER BY year;