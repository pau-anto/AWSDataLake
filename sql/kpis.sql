-- =========================================================
-- AWS Data Lake Project - Mental Health Analytics
-- KPIs Queries executed in Amazon Athena
-- Author: P4 - Analytics / Reporting
-- =========================================================


-- =========================================================
-- KPI 1
-- Total number of participants in the survey dataset
-- =========================================================
SELECT COUNT(*) AS total_participants
FROM survey;



-- =========================================================
-- KPI 2
-- Distribution of mental health treatments
-- =========================================================
SELECT treatment,
       COUNT(*) AS total
FROM survey
GROUP BY treatment
ORDER BY total DESC;



-- =========================================================
-- KPI 3
-- Impact of mental health on work performance
-- =========================================================
SELECT work_interfere,
       COUNT(*) AS total
FROM survey
GROUP BY work_interfere
ORDER BY total DESC;



-- =========================================================
-- KPI 4
-- Number of patients per diagnosis
-- =========================================================
SELECT diagnosis,
       COUNT(*) AS total_patients
FROM mental_health_diagnosis
GROUP BY diagnosis
ORDER BY total_patients DESC;



-- =========================================================
-- KPI 5
-- Average stress level by mental health condition
-- (casting required because column detected as string)
-- =========================================================
SELECT "mental health condition",
       AVG(TRY_CAST("stress level" AS INTEGER)) AS avg_stress
FROM mental_health_lifestyle
GROUP BY "mental health condition"
ORDER BY avg_stress DESC;



-- =========================================================
-- KPI 6
-- Average sleep hours by mental health condition
-- =========================================================
SELECT "mental health condition",
       AVG(TRY_CAST("sleep hours" AS DOUBLE)) AS avg_sleep
FROM mental_health_lifestyle
GROUP BY "mental health condition"
ORDER BY avg_sleep ASC;
