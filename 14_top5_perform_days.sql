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