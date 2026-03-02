-- Monthly trends with running total --

WITH monthly_totals AS (
    SELECT 
        EXTRACT(YEAR FROM date) as year,
        EXTRACT(MONTH FROM date) as month,
        SUM(donations) as monthly_donations
    FROM blood_staging
    GROUP BY EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date)
)
SELECT 
    year,
    month,
    monthly_donations,
    SUM(monthly_donations) OVER(ORDER BY year, month) as running_total,
    AVG(monthly_donations) OVER(ORDER BY year, month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as rolling_3month_avg
FROM monthly_totals
ORDER BY year, month;