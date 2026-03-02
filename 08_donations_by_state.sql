-- Donations by state with active months count --

SELECT 
    state,
    SUM(donations) as total_donations,
    COUNT(DISTINCT DATE_FORMAT(date, '%Y-%m')) as active_months,
    ROUND(AVG(donations), 2) as avg_daily_donations,
    COUNT(DISTINCT date) as active_days,
    MAX(donations) as max_donation_day,
    MIN(donations) as min_donation_day
FROM blood_staging
GROUP BY state
ORDER BY total_donations DESC;