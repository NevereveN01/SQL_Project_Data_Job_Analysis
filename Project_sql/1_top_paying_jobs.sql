    /*
    Question: What are the top-paying Data Analyst jobs?
    - Here are the top 50 highest-paying Data Analyst roles that are available remotely.
    */

    SELECT
        job_id,
        Job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        name as company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'  
        AND job_location = 'Anywhere' AND  
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 50;

/*
📊 Market Patterns & Hidden Trends

1. “Data Analyst” Is a Misleading Title
The dataset reveals that the title Data Analyst covers a wide salary range — from ~$140K to an extreme $650K.
👉 This suggests that the role is not standardized: in many cases, 
“Data Analyst” actually includes responsibilities of data scientists, engineers, or even leadership roles.

2. Salary Growth Is Strongly Tied to Seniority, Not Just Skills
Roles like Principal Data Analyst, Lead Analyst, and Director of Analytics consistently appear at the top salary levels.
👉 This indicates that career progression in data is less about stacking tools and more about:

decision-making impact

ownership

business responsibility

3. Remote Work Has Equalized High Salaries
All jobs are listed as “Anywhere”, yet salaries remain extremely high across the board.
👉 This reflects a major shift in the market:
top-tier salaries are no longer limited by location — global talent competes in a unified market.
*/