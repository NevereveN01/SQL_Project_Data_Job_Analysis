   /*
   Question: What are the top-paying skills based on salary ?
    - Here are the top 25 highest-paying skills for Data Analyst roles.
    */
   SELECT
       skills,
       ROUND (AVG(salary_year_avg), 0) AS avg_salary
   
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'  
        AND job_work_from_home = TRUE 
        -- AND salary_year_avg IS NOT NULL
    GROUP BY
        skills
    ORDER BY
        avg_salary DESC
    LIMIT 25

/*
    📊 Key Insights & Trends

1. Shift Toward Cloud & Backend Technologies
The presence of tools like Firebase, DynamoDB, Aurora, and Cassandra indicates a growing trend 
toward cloud-based and scalable database solutions. 
This reflects the increasing importance of handling large-scale, distributed data systems.

2. Strong Demand for Web & API Development Frameworks
Technologies such as Django, FastAPI, Angular, and ASP.NET Core highlight the rising need for building data-driven applications and APIs.
 This suggests that modern data professionals benefit from understanding how data is delivered and consumed in real-world systems.

3. Growing Importance of DevOps & Infrastructure Skills
Tools like Docker, Ansible, and Debian show that infrastructure and deployment skills are becoming more relevant.
 This trend points toward a shift where data specialists are expected to work closer with production environments, not just analysis.
 */