-- Donation consistency score (states with most consistent donations) --

SELECT 
    state,
    ROUND(AVG(donations), 2) as mean_donations,
    ROUND(STDDEV(donations), 2) as std_dev_donations,
    ROUND((STDDEV(donations) / NULLIF(AVG(donations), 0)), 3) * 100 as coefficient_of_variation,
    CASE 
        WHEN (STDDEV(donations) / NULLIF(AVG(donations), 0)) * 100 < 30 THEN 'HIGHLY CONSISTENT'
        WHEN (STDDEV(donations) / NULLIF(AVG(donations), 0)) * 100 < 60 THEN 'MODERATELY CONSISTENT'
        ELSE 'INCONSISTENT'
    END as consistency_category
FROM blood_staging
GROUP BY state
ORDER BY coefficient_of_variation;