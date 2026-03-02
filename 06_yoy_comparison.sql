-- Year-over-Year comparison --

SELECT 
    MONTH(date) as month_num,
    DATE_FORMAT(date, '%M') as month_name,
    
    -- Each year's donations
    SUM(CASE WHEN YEAR(date) = 2020 THEN donations ELSE 0 END) as donations_2020,
    SUM(CASE WHEN YEAR(date) = 2021 THEN donations ELSE 0 END) as donations_2021,
    SUM(CASE WHEN YEAR(date) = 2022 THEN donations ELSE 0 END) as donations_2022,
    SUM(CASE WHEN YEAR(date) = 2023 THEN donations ELSE 0 END) as donations_2023,
    SUM(CASE WHEN YEAR(date) = 2024 THEN donations ELSE 0 END) as donations_2024,
    SUM(CASE WHEN YEAR(date) = 2025 THEN donations ELSE 0 END) as donations_2025,
    SUM(CASE WHEN YEAR(date) = 2026 THEN donations ELSE 0 END) as donations_2026,
    
    -- Total across all years
    SUM(donations) as total_all_years
FROM blood_staging
WHERE YEAR(date) BETWEEN 2020 AND 2026
GROUP BY MONTH(date), DATE_FORMAT(date, '%M')
ORDER BY month_num;