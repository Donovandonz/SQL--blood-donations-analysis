CREATE DATABASE blood_donations;
USE blood_donations;


CREATE TABLE blood_staging AS
SELECT *
FROM blood_donations_state;


SELECT *
FROM blood_staging;


-- IDENTIFY QUALITY DATA ISSUES -- SUCH AS DUPLICATE --

SELECT
ROW_NUMBER() OVER(PARTITION BY `date`, state, blood_type, donations) AS row_num
FROM blood_staging;


WITH duplicate_cte AS 
(SELECT
ROW_NUMBER() OVER(PARTITION BY `date`, state, blood_type, donations) AS row_num
FROM blood_staging)
SELECT *
FROM duplicate_cte
WHERE row_num >=1;


-- Check for NULL values in specific columns --

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN `date` IS NULL THEN 1 ELSE 0 END) AS null_date,
    SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state,
    SUM(CASE WHEN blood_type IS NULL THEN 1 ELSE 0 END) AS null_ablood_type,
    SUM(CASE WHEN donations IS NULL THEN 1 ELSE 0 END) AS null_donations
FROM blood_staging;


-- Standardize Text Formatting --

 UPDATE your_table_name
 SET gender = 
   CASE 
        WHEN UPPER(gender) IN ('M', 'MALE', 'MALE ') THEN 'Male'
        WHEN UPPER(gender) IN ('F', 'FEMALE', 'FEMALE ') THEN 'Female'
        WHEN UPPER(gender) IN ('O', 'OTHER', 'NON-BINARY') THEN 'Other'
        WHEN gender IS NULL OR LTRIM(RTRIM(gender)) = '' THEN 'Unknown'
        ELSE INITCAP(LTRIM(RTRIM(gender)))  -- Capitalize first letter
    END;
    
  
  -- Convert date formats to YYYY-MM-DD --

ALTER TABLE your_table 
ADD COLUMN donation_date DATE;

SELECT 
    date as original,
    STR_TO_DATE(date, '%d/%m/%Y') as converted_date,
    DATE_FORMAT(STR_TO_DATE(date, '%d/%m/%Y'), '%Y-%m-%d') as formatted_date
FROM blood_staging;


UPDATE blood_staging 
SET donation_date = STR_TO_DATE(date, '%d/%m/%Y')
WHERE date IS NOT NULL AND date != '';

ALTER TABLE blood_staging 
MODIFY COLUMN donation_date DATE FIRST;

ALTER TABLE your_table
DROP COLUMN date;

ALTER TABLE blood_staging 
CHANGE COLUMN donation_date date DATE;


  
-- 1. Basic Aggregations & Overview --
  
  -- Overall statistics --
  
  SELECT 
    COUNT(DISTINCT date) as total_days,
    COUNT(DISTINCT state) as total_states,
    COUNT(DISTINCT blood_type) as total_blood_types,
    SUM(donations) as total_donations,
    ROUND(AVG(donations), 2) as avg_daily_donation,
    MAX(donations) as max_daily_donation,
    MIN(donations) as min_daily_donation
FROM blood_staging;


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



-- 2. Time-Based Analysis --

-- Daily trends --

SELECT 
    date,
    SUM(donations) as daily_total,
    COUNT(DISTINCT state) as states_reporting,
    COUNT(DISTINCT blood_type) as blood_types_donated
FROM blood_staging
GROUP BY date
ORDER BY date;


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


-- Weekday analysis --

SELECT 
    DAYNAME(date) as day_of_week,
    WEEKDAY(date) as dow_number,
    AVG(donations) as avg_donations,
    SUM(donations) as total_donations,
    COUNT(DISTINCT date) as days_count
FROM blood_staging
GROUP BY WEEKDAY(date), DAYNAME(date)
ORDER BY dow_number;


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


-- Yearly summary statistics --

SELECT 
    YEAR(date) as year,
    COUNT(DISTINCT date) as active_days,
    SUM(donations) as total_donations,
    ROUND(AVG(donations), 2) as avg_daily_donations,
    ROUND(STDDEV(donations), 2) as std_dev_donations,
    MAX(donations) as max_daily_donation,
    MIN(donations) as min_daily_donation,
    SUM(donations) - LAG(SUM(donations)) OVER(ORDER BY YEAR(date)) as yoy_change,
    CASE 
        WHEN LAG(SUM(donations)) OVER(ORDER BY YEAR(date)) > 0 
        THEN ROUND((SUM(donations) - LAG(SUM(donations)) OVER(ORDER BY YEAR(date))) * 100.0 / 
             LAG(SUM(donations)) OVER(ORDER BY YEAR(date)), 2)
        ELSE NULL
    END as yoy_growth_percentage
FROM blood_staging
WHERE YEAR(date) BETWEEN 2020 AND 2026
GROUP BY YEAR(date)
ORDER BY year;



-- 3. Geographic Analysis --

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


-- 4. Blood Type Deep Dive --

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


-- 5. Alert Systems & Critical Analysis --

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
  


-- 6. Performance Metrics & KPIs --

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



-- 7. Reporting & Dashboard Queries --

-- Top 5 performing days for each blood type --

WITH ranked_days AS (
    SELECT 
        blood_type,
        date,
        state,
        donations,
        RANK() OVER(PARTITION BY blood_type ORDER BY donations DESC) as ranking,  -- RANK allows ties
        DENSE_RANK() OVER(PARTITION BY blood_type ORDER BY donations DESC) as dense_ranking
    FROM blood_staging
)
SELECT 
    blood_type,
    ranking,
    date,
    DAYNAME(date) as day_of_week,
    state,
    donations,
    CASE 
        WHEN ranking = 1 THEN '🥇 BEST DAY'
        WHEN ranking = 2 THEN '🥈 SECOND BEST'
        WHEN ranking = 3 THEN '🥉 THIRD BEST'
        ELSE CONCAT('TOP ', ranking)
    END as achievement
FROM ranked_days
WHERE ranking <= 5
ORDER BY blood_type, ranking, donations DESC;


SELECT *
FROM blood_staging;



