-- Consecutive days of low donations (critical shortages) --

WITH daily_donations AS (
    SELECT 
		state,
        date,
        blood_type,
        donations,
        LAG(donations, 1) OVER(PARTITION BY blood_type ORDER BY date) as prev_day_donations,
        LAG(donations, 2) OVER(PARTITION BY blood_type ORDER BY date) as prev_2day_donations
    FROM blood_staging
)
SELECT
	state,
    date,
    blood_type,
    donations,
    prev_day_donations,
    prev_2day_donations,
    CASE 
        WHEN donations < prev_day_donations AND prev_day_donations < prev_2day_donations THEN 'DECLINING TREND'
        WHEN donations < 50 AND prev_day_donations < 50 THEN 'CRITICAL SHORTAGE'
        ELSE 'NORMAL'
    END as alert
FROM daily_donations
WHERE donations < 50 OR (donations < prev_day_donations AND prev_day_donations < prev_2day_donations);