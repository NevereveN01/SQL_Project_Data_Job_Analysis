/* 
 Question: What are the most in-demand skills for Data Analyst jobs?
 - Here are the top 10 most in-demand skills for Data Analyst jobs.
 */
 SELECT 
    skills,
    COUNT(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10
/*
📊 Deeper Market Insights

1. The Data Stack Is Still Built on Simplicity
Despite the rise of modern tools, the overwhelming dominance of SQL and Excel shows that 
the data industry still relies heavily on simple, reliable technologies.
 Innovation exists on top — but the foundation hasn’t changed.

2. The Analyst Role Is Evolving Into a Hybrid Position
The strong presence of Python, Tableau, and Power BI indicates that analysts are no longer just data processors. 
They are becoming hybrid professionals who combine coding, analysis, and storytelling into one role.

3. Communication Is a Hidden but Critical Skill
The demand for tools like PowerPoint and Word reveals an often overlooked reality:
👉 insights are only valuable if they are clearly communicated.
This highlights that top analysts are not just technical — they are also effective communicators.

💡 Strategic Takeaway

The real competitive edge is not in mastering a single tool, but in combining data, visualization, and communication into one cohesive skill set.
*/