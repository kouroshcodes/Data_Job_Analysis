/*
4. What are the top skills based on salary for my role?
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/


SELECT 
     skills,
     ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
     job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home IS TRUE
GROUP BY
     skills
ORDER BY
     avg_salary DESC
LIMIT 25;


/*The results show a clear pattern in how salaries are distributed across different technical skills:

• The highest average salaries are mostly tied to data engineering, cloud infrastructure, and large-scale data processing.
• Tools like PySpark, Databricks, Kubernetes, and Airflow stand out, indicating strong demand for building and scaling data systems.
• These roles are typically more complex and closer to production environments, which explains the higher compensation.

At the same time, another layer of insights appears when looking at more common tools:

• Data analysis libraries such as Pandas, NumPy, and Scikit-learn still offer solid salaries.
• However, they rank slightly lower due to higher competition and wider adoption across the market.
• Some niche or enterprise tools (e.g., Bitbucket, Couchbase, Watson, DataRobot) show high averages, but this may be due to smaller sample sizes or specialized roles rather than consistent demand.

Overall, the data suggests a strong trend:

• Higher salaries are linked to skills that support production systems, cloud platforms, and scalable infrastructure.
• Purely analytical or entry-level tools, while valuable, tend to offer lower salary ceilings in comparison.
*/