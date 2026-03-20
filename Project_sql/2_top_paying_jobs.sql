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
