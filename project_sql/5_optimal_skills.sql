/* What are the most optimal skills to learn as a data analyst that are in high demand and well paying
- Identify skills in high demand and associated with high salaries for data analyst roles
- Concentrate with remote positions with specified salaries
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries) 
offering strategic insights  for career development in data analysis.
*/
SELECT 
       skills_dim.skills,
       COUNT (skills_job_dim.job_id) AS demand_count,
       ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary,
       skills_dim.skill_id
      
FROM
      job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
     job_title_short = 'Data Analyst' AND
     job_work_from_home = True AND  
     salary_year_avg IS NOT NULL

GROUP BY
         skills_dim.skill_id
HAVING
      COUNT (skills_job_dim.job_id) > 10
ORDER BY
        demand_count DESC,
        avg_salary DESC
LIMIT 25;