-- Daily trends --

SELECT 
    date,
    SUM(donations) as daily_total,
    COUNT(DISTINCT state) as states_reporting,
    COUNT(DISTINCT blood_type) as blood_types_donated
FROM blood_staging
GROUP BY date
ORDER BY date;