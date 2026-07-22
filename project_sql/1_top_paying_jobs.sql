/* What are the top paying data analyst jobs
- Identify the top 10 highest-paying data analyst roles that are available remotely
- Focus on job posting specified salaries, remove null
- Get the names of company offering the jobs (Inner join)
- why? Highlight the top paying opportunities for data analysts, offering insights into employment
*/
SELECT
      job_id,
      job_posted_date,
      job_title_short,
      salary_year_avg,
      job_location,
      name
FROM 
       job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id= company_dim.company_id       
WHERE job_title_short = 'Data Analyst' AND
                         salary_year_avg IS NOT NULL AND
                         job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10;

