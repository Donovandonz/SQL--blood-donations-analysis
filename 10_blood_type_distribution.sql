-- Blood type distribution by state --

SELECT 
    state,
    SUM(CASE WHEN blood_type = 'a' THEN donations ELSE 0 END) as a,
    SUM(CASE WHEN blood_type = 'b' THEN donations ELSE 0 END) as b,
    SUM(CASE WHEN blood_type = 'ab' THEN donations ELSE 0 END) as ab,
    SUM(CASE WHEN blood_type = 'o' THEN donations ELSE 0 END) as o,
    SUM(donations) as total
FROM blood_staging
GROUP BY state
ORDER BY total DESC;
