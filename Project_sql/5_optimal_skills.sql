/* 
 Question: What are the most optimal skills to learn for Data Analyst jobs?
 - Here are the top 100 most optimal skills to learn for Data Analyst jobs.
 */
 WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) as demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id),
        average_salary AS (
   SELECT
        skills_job_dim.skill_id,
       ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
   
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'  
        AND job_work_from_home = TRUE 
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary on skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY 
    demand_count DESC,
    avg_salary DESC
LIMIT 100;

/*
📊 Key Insights & Trends

1. SQL Remains the Undisputed Core Skill
With the highest demand count by a significant margin,
 SQL clearly stands as the foundational skill for data analysts. 
 It is a mandatory requirement across almost all roles, reinforcing its position as the entry point into the field.

2. Python and BI Tools Drive Higher Value
Skills like Python, Tableau, and Power BI combine strong demand with high average salaries.
 This indicates that professionals who can both analyze data and visualize insights are significantly more valuable in the job market.

3. Cloud & Big Data Skills Command Premium Salaries
Technologies such as Snowflake, AWS, Azure, BigQuery, and Hadoop are associated with some of the highest salaries in the dataset. 
This highlights a clear trend:
👉 specialists who work with large-scale data infrastructure and cloud platforms are paid more.

💡 Key Takeaways

Start with SQL + Excel to enter the field

Add Python + BI tools to grow professionally

Learn Cloud & Big Data technologies to maximize salary

Modern data analysts are no longer just analysts — they are becoming hybrid specialists 
who combine analytics, visualization, and infrastructure knowledge. 
*/