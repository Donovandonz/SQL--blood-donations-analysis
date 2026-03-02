-- Summary by blood type --

SELECT 
    blood_type,
    SUM(donations) as total_donations,
    ROUND(AVG(donations), 2) as avg_daily_donations,
    COUNT(*) as record_count,
    SUM(donations) * 100.0 / SUM(SUM(donations)) OVER() as percentage
FROM blood_staging
GROUP BY blood_type
ORDER BY total_donations DESC;