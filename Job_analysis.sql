/* =======================================================================================
PROJECT: Data Science Job Market Analysis
OBJECTIVE: Analyzing salaries and demand for Data Roles
=================================================================*/

-- frist we need to create a place for the standardized salary year 

ALTER TABLE data_jobs_clean 
ADD COLUMN standardized_salary FLOAT;
-- we run an UPDATE command

UPDATE job.job_salary
SET standardized_salary = CASE 
    WHEN salary_rate = 'year' THEN salary_year_avg
    WHEN salary_rate = 'hour' THEN salary_hour_avg * 2080
    ELSE 0 
END;


-- Q1 Salary Benchmark: What is the average annual salary for each job 
SELECT 
    job_title_short AS "Job Category", 
    ROUND(AVG(standardized_salary), 2) AS "Average Annual Pay",
    COUNT(*) AS "Number of Postings"
FROM job.job_salary
WHERE standardized_salary > 0  
GROUP BY job_title_short
ORDER BY "Average Annual Pay" DESC;

-- Q2 Remote Premium: Is there a salary difference between "Remote" jobs and office jobs?
SELECT 
    CASE 
        WHEN job_work_from_home = 'TRUE' THEN 'Remote' 
        ELSE 'On-site/Office' 
    END AS "Work Environment",
    COUNT(*) AS "Total Jobs",
    ROUND(AVG(standardized_salary), 2) AS "Average Annual Pay"
FROM  job.job_salary
WHERE standardized_salary > 0 ;

-- Q3 The "Top 1%": What are the top 10 highest-paying specific job_title roles in the dataset 
SELECT 
    job_title, 
    job_location,
    standardized_salary AS "Highest Salary"
FROM job.job_salary
WHERE standardized_salary > 0
ORDER BY standardized_salary DESC
LIMIT 10;

-- Q4 Market Demand: Which job_title has the highest number of job postings?
SELECT 
    job_title_short, 
    COUNT(*) AS total_postings
FROM job.job_salary
GROUP BY job_title_short
ORDER BY total_postings DESC
LIMIT 10;

-- Q5 Location Hubs: Which search_location (like California or Texas) has the most job openings for Data Engineers?
SELECT 
    search_location AS "Location", 
    COUNT(*) AS "Data Engineer Openings"
FROM job.job_salary
WHERE job_title_short = 'Data Engineer'
GROUP BY search_location
ORDER BY "Data Engineer Openings" DESC
limit 5 ;

-- Q6 Degree Requirement Analysis: What percentage of high-paying jobs (over $100k) mention "no degree" in the job_no_degree_mention column?
SELECT 
    COUNT(CASE WHEN job_no_degree_mention = 'TRUE' THEN 1 END) AS "No Degree Mentioned",
    COUNT(*) AS "Total High-Paying Jobs",
    ROUND(
        COUNT(CASE WHEN job_no_degree_mention = 'TRUE' THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS "Percentage (%)"
FROM job.job_salary
WHERE standardized_salary > 100000;

-- Q7 Hiring Platforms: Which platform (job_via) is the most popular for posting Data Analyst roles? (e.g., LinkedIn vs. Indeed)
SELECT 
    job_via AS "Platform", 
    COUNT(*) AS "Total Postings"
FROM job.job_salary
GROUP BY job_via
ORDER BY 2   desc 
limit 5 ;
-- Q8 The Insurance Factor: Do companies that offer health insurance (job_health_insurance = TRUE) tend to pay more or less on average?
SELECT 
    CASE 
        WHEN job_health_insurance = 'TRUE' THEN 'Offers Insurance' 
        ELSE 'No Mention/Not Offered' 
    END AS "Health Insurance",
    ROUND(AVG(standardized_salary), 2) AS "Avg Annual Salary",
    COUNT(*) AS "Job Count"
FROM job.job_salary
WHERE standardized_salary > 0
GROUP BY job_health_insurance;

-- Q9 Skill Trends: Which specific skills (from the job_skills column) are most common in jobs paying over $150,000?
SELECT 
    job_schedule_type, 
    ROUND(AVG(standardized_salary), 2) AS "Average Salary",
    COUNT(*) AS "Number of Jobs"
FROM job.job_salary
WHERE standardized_salary > 0
GROUP BY job_schedule_type
ORDER BY "Average Salary" DESC;
-- Q10 Entry-Level vs. Senior: Compare the average salary of titles containing the word "Senior" vs. titles containing "Junior" or "Intern".
SELECT 
    search_location AS "Location",
    ROUND(AVG(standardized_salary), 2) AS "Avg Salary",
    COUNT(*) AS "Job Count"
FROM job.job_salary
WHERE job_title_short = 'Data Analyst' 
  AND standardized_salary > 0
  AND search_location LIKE '%, United States'
GROUP BY search_location
HAVING COUNT(*) > 10 -- Filters for locations with at least 10 jobs for better accuracy
ORDER BY "Avg Salary" DESC
LIMIT 5;