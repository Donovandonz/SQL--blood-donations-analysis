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

---

## Geographic Analysis

| State | Total Donations | Active Months | Avg Daily Donations | Active Days | Max Donation Day | Min Donation Day |
|-------|-----------------|---------------|---------------------|-------------|------------------|------------------|
| W.P. Kuala Lumpur | 1,186,475 | 74 | 133.31 | 2,225 | 750 | 0 |
| Perak | 274,300 | 74 | 30.82 | 2,225 | 234 | 0 |
| Johor | 264,353 | 74 | 29.70 | 2,225 | 243 | 0 |
| Pulau Pinang | 241,913 | 74 | 27.18 | 2,225 | 208 | 0 |
| Sarawak | 239,743 | 74 | 26.94 | 2,225 | 210 | 0 |
| Sabah | 223,121 | 74 | 25.07 | 2,225 | 584 | 0 |
| Selangor | 182,188 | 74 | 20.47 | 2,225 | 243 | 0 |
| Melaka | 175,214 | 74 | 19.69 | 2,225 | 211 | 0 |
| Pahang | 142,603 | 74 | 16.02 | 2,225 | 115 | 0 |
| Kedah | 126,239 | 74 | 14.18 | 2,225 | 179 | 0 |
| Terengganu | 113,440 | 74 | 12.75 | 2,225 | 117 | 0 |
| Negeri Sembilan | 99,744 | 74 | 11.21 | 2,225 | 115 | 0 |
| Kelantan | 96,299 | 74 | 10.82 | 2,225 | 285 | 0 |

## 🏆 Key Insights
- **Top Performer**: **W.P. Kuala Lumpur** dominates with **1,186,475** total donations (63% of total)
- **Second Place**: **Perak** with **274,300** donations
- **Third Place**: **Johor** with **264,353** donations
- **Highest Single Day**: W.P. Kuala Lumpur with **750** donations
- **Notable Peak**: Sabah recorded **584** donations on max day (2nd highest)
- **Total Donations Across All States**: **3,462,132**

## 📊 State Rankings (by Total Donations)
1. 🥇 **W.P. Kuala Lumpur** - 1,186,475
2. 🥈 **Perak** - 274,300
3. 🥉 **Johor** - 264,353
4. **Pulau Pinang** - 241,913
5. **Sarawak** - 239,743
6. **Sabah** - 223,121
7. **Selangor** - 182,188
8. **Melaka** - 175,214
9. **Pahang** - 142,603
10. **Kedah** - 126,239
11. **Terengganu** - 113,440
12. **Negeri Sembilan** - 99,744
13. **Kelantan** - 96,299

---

## Blood type distribution by state

 State | A | B | AB | O | Total |
|-------|---|---|----|---|-------|
| W.P. Kuala Lumpur | 297,224 | 321,991 | 61,963 | 505,297 | 1,186,475 |
| Perak | 67,407 | 74,849 | 16,683 | 115,361 | 274,300 |
| Johor | 64,251 | 71,137 | 13,692 | 115,273 | 264,353 |
| Pulau Pinang | 59,977 | 65,274 | 14,924 | 101,738 | 241,913 |
| Sarawak | 56,860 | 68,165 | 15,096 | 99,622 | 239,743 |
| Sabah | 50,031 | 54,161 | 10,975 | 107,954 | 223,121 |
| Selangor | 44,386 | 49,386 | 10,213 | 78,203 | 182,188 |
| Melaka | 44,375 | 46,595 | 10,827 | 73,417 | 175,214 |
| Pahang | 36,197 | 39,951 | 8,708 | 57,747 | 142,603 |
| Kedah | 31,209 | 35,546 | 8,002 | 51,482 | 126,239 |
| Terengganu | 27,741 | 31,531 | 8,038 | 46,130 | 113,440 |
| Negeri Sembilan | 24,529 | 26,916 | 5,188 | 43,111 | 99,744 |
| Kelantan | 25,647 | 25,350 | 6,578 | 38,724 | 96,299 |

## 🏆 Key Insights

### Blood Type Distribution (All States Combined)
| Blood Type | Total Donations | Percentage |
|------------|-----------------|------------|
| **O** | 1,394,419 | 40.3% |
| **B** | 911,852 | 26.3% |
| **A** | 829,834 | 24.0% |
| **AB** | 190,887 | 5.5% |

### State Rankings by Blood Type
- **🥇 W.P. Kuala Lumpur** dominates all categories:
  - A: 297,224 (35.8% of total A)
  - B: 321,991 (35.3% of total B)
  - AB: 61,963 (32.5% of total AB)
  - O: 505,297 (36.2% of total O)

### Blood Type Compatibility Facts
- **🩸 Universal Donors**: O- (can donate to all)
- **🩸 Universal Recipients**: AB+ (can receive from all)
- **🤝 Most Common Donor**: O Positive
- **🔬 Rarest Type**: AB Negative (represented in AB category)

---

## Performance Metrics & KPIs

| State | Mean Donations | Std Dev | Coefficient of Variation | Consistency Category |
|-------|---------------|---------|--------------------------|---------------------|
| W.P. Kuala Lumpur | 133.31 | 99.75 | 74.8 | INCONSISTENT |
| Perak | 30.82 | 26.14 | 84.8 | INCONSISTENT |
| Pulau Pinang | 27.18 | 24.44 | 89.9 | INCONSISTENT |
| Terengganu | 12.75 | 12.14 | 95.2 | INCONSISTENT |
| Johor | 29.70 | 28.41 | 95.6 | INCONSISTENT |
| Kedah | 14.18 | 13.59 | 95.8 | INCONSISTENT |
| Sarawak | 26.94 | 26.68 | 99.1 | INCONSISTENT |
| Melaka | 19.69 | 20.10 | 102.1 | INCONSISTENT |
| Pahang | 16.02 | 16.52 | 103.1 | INCONSISTENT |
| Selangor | 20.47 | 22.45 | 109.7 | INCONSISTENT |
| Negeri Sembilan | 11.21 | 12.77 | 113.9 | INCONSISTENT |
| Sabah | 25.07 | 28.97 | 115.6 | INCONSISTENT |
| Kelantan | 10.82 | 12.76 | 118.0 | INCONSISTENT |

## 📈 Key Performance Indicators (KPIs)

### Consistency Rankings (by Coefficient of Variation - Lower is More Consistent)
1. 🥇 **W.P. Kuala Lumpur** - CV: 74.8% (Most Consistent)
2. 🥈 **Perak** - CV: 84.8%
3. 🥉 **Pulau Pinang** - CV: 89.9%
4. **Terengganu** - CV: 95.2%
5. **Johor** - CV: 95.6%
6. **Kedah** - CV: 95.8%
7. **Sarawak** - CV: 99.1%
8. **Melaka** - CV: 102.1%
9. **Pahang** - CV: 103.1%
10. **Selangor** - CV: 109.7%
11. **Negeri Sembilan** - CV: 113.9%
12. **Sabah** - CV: 115.6%
13. **Kelantan** - CV: 118.0% (Most Volatile)

### 📊 Statistical Summary
| Metric | Value |
|--------|-------|
| **Overall Mean (All States)** | 29.83 |
| **Average CV Across States** | 99.8% |
| **Most Consistent State** | W.P. Kuala Lumpur (74.8% CV) |
| **Most Volatile State** | Kelantan (118.0% CV) |
| **Lowest Mean** | Kelantan (10.82) |
| **Highest Mean** | W.P. Kuala Lumpur (133.31) |
| **Highest Std Dev** | W.P. Kuala Lumpur (99.75) |

## 🔍 Key Insights

### Volatility Patterns
- **📉 All states classified as "INCONSISTENT"** (CV > 50%)
- **🏆 W.P. Kuala Lumpur** shows the most consistent pattern despite highest absolute volatility
- **⚠️ Kelantan** exhibits the most unpredictable donation patterns
- **📊 East Malaysian states** (Sabah, Sarawak) show high volatility

### Performance Categories
- **High Performers** (Mean > 25): KL, Perak, Johor, Penang, Sarawak, Sabah
- **Medium Performers** (Mean 15-25): Selangor, Melaka, Pahang
- **Low Performers** (Mean < 15): Kedah, Terengganu, Negeri Sembilan, Kelantan

### Risk Assessment
- **Low Risk** (CV < 80%): W.P. Kuala Lumpur only
- **Medium Risk** (CV 80-100%): Perak, Penang, Terengganu, Johor, Kedah, Sarawak
- **High Risk** (CV > 100%): Melaka, Pahang, Selangor, Negeri Sembilan, Sabah, Kelantan

---

## Top 5 performing days for each blood type

### 🅰️ Blood Type A - Top 5 Days
| Rank | Date | Day of Week | State | Donations | Achievement |
|------|------|-------------|-------|-----------|-------------|
| 🥇 1 | 2026-02-01 | Sunday | W.P. Kuala Lumpur | 413 | BEST DAY |
| 🥈 2 | 2020-08-09 | Sunday | W.P. Kuala Lumpur | 412 | SECOND BEST |
| 🥉 3 | 2024-05-01 | Wednesday | W.P. Kuala Lumpur | 408 | THIRD BEST |
| 4 | 2020-10-24 | Saturday | W.P. Kuala Lumpur | 398 | TOP 4 |
| 5 | 2023-05-01 | Monday | W.P. Kuala Lumpur | 382 | TOP 5 |

### 🆎 Blood Type AB - Top 5 Days
| Rank | Date | Day of Week | State | Donations | Achievement |
|------|------|-------------|-------|-----------|-------------|
| 🥇 1 | 2026-02-01 | Sunday | W.P. Kuala Lumpur | 129 | BEST DAY |
| 🥈 2 | 2020-02-08 | Saturday | W.P. Kuala Lumpur | 104 | SECOND BEST |
| 🥉 3 | 2023-06-18 | Sunday | W.P. Kuala Lumpur | 97 | THIRD BEST |
| 4 | 2023-05-04 | Thursday | W.P. Kuala Lumpur | 93 | TOP 4 |
| 5 | 2025-06-15 | Sunday | W.P. Kuala Lumpur | 90 | TOP 5 |

### 🅱️ Blood Type B - Top 5 Days
| Rank | Date | Day of Week | State | Donations | Achievement |
|------|------|-------------|-------|-----------|-------------|
| 🥇 1 | 2026-02-01 | Sunday | W.P. Kuala Lumpur | 615 | BEST DAY |
| 🥈 2 | 2025-02-11 | Tuesday | W.P. Kuala Lumpur | 519 | SECOND BEST |
| 🥉 3 | 2020-02-08 | Saturday | W.P. Kuala Lumpur | 479 | THIRD BEST |
| 4 | 2020-10-18 | Sunday | W.P. Kuala Lumpur | 474 | TOP 4 |
| 4 | 2024-01-25 | Thursday | W.P. Kuala Lumpur | 474 | TOP 4 |

### 🅾️ Blood Type O - Top 5 Days
| Rank | Date | Day of Week | State | Donations | Achievement |
|------|------|-------------|-------|-----------|-------------|
| 🥇 1 | 2026-02-01 | Sunday | W.P. Kuala Lumpur | 750 | BEST DAY |
| 🥈 2 | 2025-02-11 | Tuesday | W.P. Kuala Lumpur | 726 | SECOND BEST |
| 🥉 3 | 2024-01-25 | Thursday | W.P. Kuala Lumpur | 688 | THIRD BEST |
| 4 | 2024-05-01 | Wednesday | W.P. Kuala Lumpur | 647 | TOP 4 |
| 5 | 2020-02-08 | Saturday | W.P. Kuala Lumpur | 632 | TOP 5 |

## 🏆 Key Insights

### All-Time Records
| Blood Type | Record | Date | Donations |
|------------|--------|------|-----------|
| **🅾️ O** | Highest Single Day | 2026-02-01 | 750 |
| **🅱️ B** | Second Highest | 2026-02-01 | 615 |
| **🅰️ A** | Third Highest | 2026-02-01 | 413 |
| **🆎 AB** | Fourth Highest | 2026-02-01 | 129 |

### 📅 Historic Day: **2026-02-01 (Sunday)**
This date appears as the #1 best day for **ALL FOUR** blood types! 🎯

### Day of Week Patterns
- **Sunday** dominates with 7 appearances in top rankings
- **Tuesday** appears twice (B #2, O #2)
- **Thursday** appears twice (B #4, O #3)
- **Saturday** appears three times
- **Monday** and **Wednesday** have one appearance each

---

## 👇Full SQL-code query analysis👇
-<a href="https://github.com/Donovandonz/SQL--blood-donations-analysis/blob/main/Blood_donations_analysis_db.sql">Blood-donations-analysis</a>

## Dashboard Overview 

-<a href="https://github.com/Donovandonz/Tableau--blood-donations-dashboard">Blood-donations-dashboard</a>
