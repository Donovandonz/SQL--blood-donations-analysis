-- State monthly performance --

SELECT 
    state,
    DATE_FORMAT(date, '%Y-%m-01') as month,
    SUM(donations) as monthly_donations,
    LAG(SUM(donations), 1) OVER(PARTITION BY state ORDER BY DATE_FORMAT(date, '%Y-%m-01')) as prev_month,
    SUM(donations) - LAG(SUM(donations), 1) OVER(PARTITION BY state ORDER BY DATE_FORMAT(date, '%Y-%m-01')) as mom_change,
    CASE 
        WHEN LAG(SUM(donations), 1) OVER(PARTITION BY state ORDER BY DATE_FORMAT(date, '%Y-%m-01')) > 0 
        THEN ROUND(
            (SUM(donations) - LAG(SUM(donations), 1) OVER(PARTITION BY state ORDER BY DATE_FORMAT(date, '%Y-%m-01'))) * 100.0 / 
            LAG(SUM(donations), 1) OVER(PARTITION BY state ORDER BY DATE_FORMAT(date, '%Y-%m-01')),
            2
        )
        ELSE NULL
    END as mom_change_percentage
FROM blood_staging
GROUP BY state, DATE_FORMAT(date, '%Y-%m-01')
ORDER BY state, month;