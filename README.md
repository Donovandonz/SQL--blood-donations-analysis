# SQL--blood-donations-analysis
🩸 Blood Donation Analysis SQL Project

## Dataset used

-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/blood_donations_state.csv">RAW.blood-donations</a>

---

## 📋 Project Overview
A comprehensive SQL analysis of blood donation data spanning **2020-2026**, examining donation patterns, geographic distribution, blood type preferences, and critical shortage alerts. This project demonstrates advanced SQL techniques for healthcare data analytics.

---

## 🛠️ Technologies Used
- **Database:** MySQL Workbench
- **SQL Techniques:** CTEs, Window Functions, Subqueries, Aggregations
- **Analysis:** Time Series, Geographic Analysis, Statistical Metrics
- **Visualization:** Tableau (for dashboard)

---

## 📊 Dataset Overview
- **Time Period:** 2020 - 2026
- **Blood Types:** A, B, AB, O
- **Geographic Coverage:** Multiple states (Malaysia)
- **Key Metrics:** Daily donations, state-wise distribution, blood type preferences

---

## 🔍 SQL Analysis Performed

### 1. **Data Cleaning & Preparation** 🧹
- Duplicate detection and removal
- NULL value identification
- Date format standardization
- Data quality assessment

### 2. **Exploratory Data Analysis** 📈
- Overall statistics and aggregations
- Blood type distribution analysis
- State-wise performance metrics
- Daily/Weekly/Monthly trends

### 3. **Time-Based Analysis** ⏰
- Year-over-Year (YoY) growth analysis
- Monthly trends with running totals
- Weekday vs weekend patterns
- Seasonal donation patterns

### 4. **Geographic Analysis** 🗺️
- State-wise donation rankings
- Monthly state performance tracking
- Geographic distribution patterns

### 5. **Blood Type Deep Dive** 🩸
- Distribution by state
- Type popularity trends
- Critical shortage analysis by blood type

### 6. **Alert Systems** ⚠️
- Critical shortage detection (<50 donations)
- Declining trend identification
- Consecutive low donation alerts

### 7. **Performance Metrics** 📊
- Donation consistency scoring
- Monthly target achievement tracking
- Coefficient of variation analysis

---

## 📊 Key Business Questions Answered

| # | Question | SQL File |
|:--:|----------|----------|
| 1 | Overall statistics? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/01_overall_statistic.sql">SQL-query</a> |
| 2 | Summary by blood type? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/02_summary_by_blood-type.sql">SQL-query</a> |
| 3 | Daily trends (NA, EU, JP, Other) differ by genre? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/03_daily_trends.sql">SQL-query</a> |
| 4 | Monthly trends with running total? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/04_monthly_trends.sql">SQL-query</a> |
| 5 | Weekday analysis? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/05_weekday_analysis.sql">SQL-query</a> |
| 6 | Year-over-Year comparison? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/06_yoy_comparison.sql">SQL-query</a> |
| 7 | Yearly summary statistics? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/07_yearly_summary_statistic.sql">SQL-query</a> |
| 8 | Donations by state with active months count? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/08_donations_by_state.sql">SQL-query</a> |
| 9 | State monthly performance? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/09_state_monthly_performance.sql">SQL-query</a> |
| 10 | Blood type distribution by state? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/10_blood_type_distribution.sql">SQL-query</a> |
| 11 | Consecutive days of low donations (critical shortages)? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/11_critical_blood_shortage.sql">SQL-query</a> |
| 12 | Donation consistency score (states with most consistent donations)? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/12_donations_consistency_score.sql">SQL-query</a>|
| 13 | Monthly targets and achievement? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/13_monthly_target_donations.sql">SQL-query</a> |
| 14 | Top 5 performing days for each blood type? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/14_top5_perform_days.sql">SQL-query</a> |

