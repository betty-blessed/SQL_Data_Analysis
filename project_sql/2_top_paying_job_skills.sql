/* What are the skills required for these top paying roles
- use the top 10 highest paying data analyst jobs from query 1
- Add specific skills required for these roles
- why? It provides a detailed look at which skills are required for these high-paying jobs, 
helping job seekers to know which skills to be keen on
*/
WITH top_paying_jobs AS (
      SELECT
      job_postings_fact.job_id,
      job_title_short,
      salary_year_avg,
      job_location,
      name AS company_name
      FROM 
            job_postings_fact
      LEFT JOIN company_dim ON job_postings_fact.company_id= company_dim.company_id       
      WHERE job_title_short = 'Data Analyst' AND
                              salary_year_avg IS NOT NULL AND
                              job_location = 'Anywhere'
      ORDER BY salary_year_avg DESC
      LIMIT 10
)
SELECT 
       skills,
      top_paying_jobs. *
FROM
      top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
         salary_year_avg DESC;      


