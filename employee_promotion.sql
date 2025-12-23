-- create an empty table
CREATE TABLE employee_promotion (
    employee_id INT PRIMARY KEY,
    department VARCHAR(50),
    region VARCHAR(50),
    education VARCHAR(50),
    gender VARCHAR(10),
    recruitment_channel VARCHAR(50),

    no_of_trainings INT,
    age INT,
    previous_year_rating INT,
    length_of_service INT,
    awards_won BIT,

    avg_training_score INT,
    is_promoted BIT
);

SELECT * FROM employee_promotion;

"C:\Users\nandana\Desktop\employee_promotion\employee_promotion.csv"

-- bulk insert
BULK INSERT employee_promotion
FROM 'C:\Users\nandana\Desktop\employee_promotion\employee_promotion.csv'
WITH (
    FIRSTROW = 2,                -- skip header
    FIELDTERMINATOR = ',',       -- CSV delimiter
    ROWTERMINATOR = '\n',
    TABLOCK
);

SELECT COUNT(*) AS total_rows FROM employee_promotion;

-- business queries
--1.Promotion Leakage Analysis
SELECT
    COUNT(*) AS Employees,
    SUM(CAST(is_promoted AS INT)) AS Promoted,
    ROUND(
        100.0 * SUM(CAST(is_promoted AS INT)) / COUNT(*),
        2
    ) AS Promotion_Rate
FROM employee_promotion;

-- insights
--Promotions are highly selective (less than 1 in 10 employees promoted)
--Indicates a competitive promotion environment
--Makes promotion decisions high-impact for morale and retention

--2.Promotion ROI on Training
SELECT
    CASE
        WHEN no_of_trainings >= 3 THEN 'High Training'
        WHEN no_of_trainings = 2 THEN 'Medium Training'
        ELSE 'Low Training'
    END AS Training_Level,
    COUNT(*) AS Employees,
    ROUND(
        100.0 * SUM(CAST(is_promoted AS INT)) / COUNT(*),
        2
    ) AS Promotion_Rate_Pct
FROM employee_promotion
GROUP BY
    CASE
        WHEN no_of_trainings >= 3 THEN 'High Training'
        WHEN no_of_trainings = 2 THEN 'Medium Training'
        ELSE 'Low Training'
    END;
-- insights
-- Higher training participation does NOT lead to higher promotion
-- Training programs may be misaligned with promotion criteria
--Possible wasted L&D investment

--3.Career Stage vs Promotion Efficiency
SELECT
    CASE
        WHEN length_of_service <= 3 THEN 'Early Career'
        WHEN length_of_service BETWEEN 4 AND 7 THEN 'Mid Career'
        ELSE 'Late Career'
    END AS Career_Stage,
    COUNT(*) AS Employees,
    ROUND(
        100.0 * SUM(CAST(is_promoted AS INT)) / COUNT(*),
        2
    ) AS Promotion_Rate_Pct
FROM employee_promotion
GROUP BY
    CASE
        WHEN length_of_service <= 3 THEN 'Early Career'
        WHEN length_of_service BETWEEN 4 AND 7 THEN 'Mid Career'
        ELSE 'Late Career'
    END;
-- insights
--Promotions are concentrated in mid-tenure
--Early-career employees may feel career stagnation
--Risk of early attrition of high-potential talent

--4.Bias Check (Performance Controlled)
SELECT
    gender,
    COUNT(*) AS Employees,
    ROUND(
        100.0 * SUM(CAST(is_promoted AS INT)) / COUNT(*),
        2
    ) AS Promotion_Rate_Pct
FROM employee_promotion
WHERE previous_year_rating >= 4
GROUP BY gender;
-- insights
--Promotions are highly selective (less than 1 in 10 employees promoted)
-- Indicates a competitive promotion environment
-- Promotion decisions have high impact on morale and retention

--5.Award Impact on Promotion
SELECT
    awards_won,
    COUNT(*) AS Employees,
    ROUND(
        100.0 * SUM(CAST(is_promoted AS INT)) / COUNT(*),
        2
    ) AS Promotion_Rate_Pct
FROM employee_promotion
GROUP BY awards_won;
--insights
--Award winners are 5× more likely to be promoted
--Formal recognition is a major promotion signal
--Awards strongly influence managerial decisions

--6.High Effort – No Reward (Retention Risk)
SELECT
    COUNT(*) AS At_Risk_Employees
FROM employee_promotion
WHERE avg_training_score >= 85
  AND previous_year_rating >= 4
  AND is_promoted = 0;
 --insights
--1,306 employees show high effort and high performance
--No promotion = high disengagement risk
--This group is most likely to churn


--7.Recruitment Channel Quality (Speed to Promotion)
SELECT
    recruitment_channel,
    ROUND(AVG(length_of_service), 2) AS Avg_Years_To_Promotion
FROM employee_promotion
WHERE is_promoted = 1
GROUP BY recruitment_channel
ORDER BY Avg_Years_To_Promotion;
--insights
 --Referral hires reach promotion faster
--Referrals likely produce better cultural or skill fit
--Referral hiring is cost-effective and high quality

--8.Department Promotion Inefficiency
SELECT
    department,
    COUNT(*) AS High_Performers,
    SUM(CAST(is_promoted AS INT)) AS Promoted,
    ROUND(
        100.0 * SUM(CAST(is_promoted AS INT)) / COUNT(*),
        2
    ) AS Promotion_Conversion_Pct
FROM employee_promotion
WHERE previous_year_rating >= 4
GROUP BY department
HAVING
    ROUND(
        100.0 * SUM(CAST(is_promoted AS INT)) / COUNT(*),
        2
    ) < 30;
--insights
--Several departments show high performance but low promotion conversion
--Indicates structural bottlenecks, not performance issues
--HR, Legal, and R&D are most constrained
