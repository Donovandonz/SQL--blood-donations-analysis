-- Monthly targets and achievement --

WITH monthly_targets AS (
    SELECT 
        DATE_FORMAT(date, '%Y-%m-01') as month,
        SUM(donations) * 1.1 as target  -- 10% growth target
    FROM blood_staging
    GROUP BY DATE_FORMAT(date, '%Y-%m-01')
),
actual_donations AS (
    SELECT 
        DATE_FORMAT(date, '%Y-%m-01') as month,
        SUM(donations) as actual
    FROM blood_staging
    GROUP BY DATE_FORMAT(date, '%Y-%m-01')
)
SELECT 
    DATE_FORMAT(ad.month, '%Y-%m') as month,
    ad.actual,
    ROUND(mt.target, 2) as target,
    ROUND((ad.actual - mt.target) * 100.0 / mt.target, 2) as pct_vs_target,
    ROUND(ad.actual - mt.target, 2) as difference,
    CASE 
        WHEN ad.actual >= mt.target THEN '✅ MET TARGET'
        ELSE '❌ BELOW TARGET'
    END as target_status,
    CASE 
        WHEN ad.actual >= mt.target * 1.2 THEN 'EXCEPTIONAL'
        WHEN ad.actual >= mt.target * 1.1 THEN 'STRONG'
        WHEN ad.actual >= mt.target THEN 'MET'
        WHEN ad.actual >= mt.target * 0.9 THEN 'CLOSE'
        WHEN ad.actual >= mt.target * 0.8 THEN 'SHORT'
        ELSE 'CRITICAL'
    END as performance_level
FROM actual_donations ad
JOIN monthly_targets mt ON ad.month = mt.month
ORDER BY ad.month DESC;