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
| 3 | Daily trends? |-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/03_daily_trends.sql">SQL-query</a> |
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


---


## 1)💡 Key Insights
📈 Overall Statistics Breakdown (2020-2026)


| Metric | Value | Insight |
|--------|-------|---------|
| **Total Days** | 2,225 | 6.1 years of data (2020-2026) |
| **Total States** | 13 | Regional coverage established |
| **Blood Types** | 4 | Complete tracking (A, B, AB, O) |
| **Total Donations** | 3,365,632 | 3.37M lives potentially saved |
| **Daily Average** | 29.09 | Moderate - room for growth |
| **Peak Day** | 750 | Exceptional peak capacity |
| **Zero Days** | Present | ⚠️ CRITICAL CONCERN |
| **Potential** | 12.4M/year | At peak capacity (750 × 365) |


### ✅ WHAT'S WORKING:
- 3.37M donations = 3.37M lives saved
- 13 states = strong foundation
- 750 peak day = proven capacity

### ⚠️ WHAT'S NOT:
- Zero donation days = PATIENTS AT RISK
- 2.24 per state = 96% untapped potential
- 29.09 daily avg = operating at 4% capacity

### 🎯 THE OPPORTUNITY:
- Eliminate zero days = save more lives
- Increase to 50 daily = +70% more donations
- Hit 750 regularly = 12.4M annual potential

---

## 🩸 BLOOD TYPE DISTRIBUTION SUMMARY


### ✅ WHAT'S WORKING:
- Type O dominates at 42.61% - strong universal donor supply
- All blood types have consistent daily donations
- 3.36M total donations across all types

### ⚠️ WHAT'S NOT:
- Type AB only 5.67% - vulnerable to shortages
- Type A (24.66%) may be below typical demand
- Rare type donors hard to replace

### 🎯 THE OPPORTUNITY:
- Target Type A recruitment to match demand
- Create Type AB donor registry for emergencies
- Leverage Type B surplus for regional sharing

---

## 📈 Yearly Performance Summary

| Year | Total | Donations |	vs Previous	| Growth |	Status|
|:----:|-------|-----------|--------------|--------|--------|
| 2020 | 497,577 | Baseline	|-	| 🟨| START |
| 2021 | 503,749 | +6,172	| +1.2% |	🟥 | GROWTH |
| 2022	| 559,800	| +56,051 |	+11.1% |	🟪 | SURGE |
| 2023	| 575,375 |	+15,575	| +2.8%	| 🟥 | GROWTH |
| 2024	| 587,268	| +11,893	| +2.1%	| 🟥 | GROWTH |
| 2025	| 595,385	| +8,117 | +1.4%	| 🟨 | STEADY |
| 2026	| 56,028*	| -539,357 |	-90.6%* |	🟧 | INCOMPLETE |


## Monthly donation data spanning 7 years (2020-2026) with rankings:

| Month | 2020   | 2021   | 2022   | 2023   | 2024   | 2025   | 2026   | Total    | Rank      |
|-------|--------|--------|--------|--------|--------|--------|--------|----------|-----------|
| Jan   | 42,027 | 42,400 | 44,455 | 46,494 | 49,332 | 47,247 | 50,937 | 322,892  | 🥇 #1    |
| Feb   | 46,416 | 41,475 | 38,701 | 47,898 | 46,865 | 53,649 | 5,091  | 280,095  | #6       || Mar   | 37,921 | 44,932 | 48,537 | 53,091 | 51,791 | 40,948 | 0      | 277,220  | #8       |
| Apr   | 31,273 | 37,511 | 38,448 | 37,085 | 42,866 | 50,355 | 0      | 237,538  | #12      |
| May   | 39,740 | 43,052 | 49,363 | 51,370 | 53,709 | 54,646 | 0      | 291,880  | #3       |
| Jun   | 45,851 | 43,716 | 53,997 | 54,115 | 50,152 | 48,555 | 0      | 296,386  | 🥈 #2    |
| Jul   | 39,677 | 31,622 | 47,719 | 48,114 | 47,665 | 50,579 | 0      | 265,376  | #11      |
| Aug   | 50,761 | 44,979 | 47,957 | 48,958 | 49,706 | 52,104 | 0      | 294,465  | #4       |
| Sep   | 38,995 | 42,981 | 46,958 | 47,232 | 47,521 | 44,527 | 0      | 268,214  | #10      |
| Oct   | 43,391 | 40,095 | 51,108 | 47,596 | 50,336 | 48,513 | 0      | 281,039  | #5       |
| Nov   | 41,743 | 42,524 | 43,058 | 45,806 | 47,728 | 51,424 | 0      | 272,283  | #9       |
| Dec   | 39,782 | 44,462 | 49,499 | 47,616 | 49,597 | 47,288 | 0      | 278,244  | #7       |


## 📌 Bottom Line Insights

### ✅ WHAT'S WORKING:
- January is consistently strong (322,892 total)
- 19.7% total growth from 2020 to 2025
- 2022 saw 11.1% surge - replicable success
- May, June, August all exceed 290K

### ⚠️ WHAT'S NOT:
- April is 26% below January (237,538)
- July and September summer slumps
- 2026 data shows incomplete year

### 🎯 THE OPPORTUNITY:
- Fix April = +85K potential
- Smooth summer = +50K potential
- Replicate 2022 surge = +56K potential


