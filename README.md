# Data Job Market Analysis
📌 Project Description
This project is a comprehensive SQL-based data analysis exploring the global job market for data professionals. Using a raw dataset of over 3100 job postings, I performed extensive data cleaning, standardization, and exploratory analysis to uncover trends in salaries, remote work, and hiring platforms.

The goal was to move beyond raw numbers to provide actionable insights for job seekers and recruiters in the data space.

🛠️ Data Cleaning Steps
Before analysis, I performed the following "data hygiene" steps to ensure accuracy:

Unique Identification: Added a job_id (Primary Key) to uniquely identify each posting.

Salary Standardization: Converted all salary data into a single standardized_salary column for consistent comparison.

Filtering: Removed records with missing or zero-value salaries to prevent skewing the averages.

Labeling: Created custom descriptive IDs for specific job categories (e.g., "Data Analyst 1").

❓ Business Questions Answered
I used SQL to answer the following 10 critical business questions:

Salary Benchmarks: What is the average annual salary for each major Job Category?

Work Environment: Is there a significant salary difference between Remote and On-site jobs?

High-Value Roles: What are the top 10 highest-paying specific job titles in the dataset?

Market Demand: Which job category has the highest volume of total job postings?

Location Hubs: Which geographic locations (States/Areas) have the most openings for Data Engineers?

Degree Requirements: What percentage of high-paying jobs (>$100k) do not mention a degree requirement?

Platform Dominance: Which job search platforms (LinkedIn, Indeed, etc.) host the most data roles?

Benefits Analysis: How does the mention of Health Insurance correlate with the offered salary?

Schedule Flexibility: Which schedule type (Full-time vs. Contract) offers the highest average compensation?

Geographic Sweet Spots: Which U.S. locations offer the highest average salary for Data Analysts specifically?
