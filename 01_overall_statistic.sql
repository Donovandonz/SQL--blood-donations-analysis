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