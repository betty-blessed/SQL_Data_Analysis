# Introduction
Dive into data job market! Focusing on data analyst roles, This project explores top paying jobs, in-demand skills, and where high demand meets high salary in data analytics.

SQL queries? Check them out here: [project_sql folder](/project_sql/)
# Background
Driven by a quest to navigate the data analyst job market more effectively, there was the desire to pinpoint in-demand data analytic skills and top paying.

### The questions I wanted to answer through SQL queries were:
1. What are the top paying data analyst jobs?
2. What are the skills required for these top paying roles?
3. What are the most in demand skills for data analyst?
4. What are the top skills based on salary for a data analyst?
5. What are the most optimal skills to learn as a data analyst that are in high demand and well paying?
# Tools I used
For my deep dive into the data analyst job market, I harnessed the power of several tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and bring out critical insights
- **PostgreSQL**: The choosen database management system, ideal for handling the job posting data.
- **Visual Studio Code**: My go to for database management and executing SQL queries.
- **Git and GitHub**:
Essential for version control and sharing my SQL scripts and analysis, ensuaring collaboration and project tracking.
# The analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market.
### Here is how I approached each question:

#### 5. Optimal skills and Top Paying Data Analyst Jobs
To identify optimal skills and highest paying roles, I filtered data analyst positions and skills by average year salary, location and skills needed focusing on remote jobs.

```sql
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
```
![Skill_Demand_Trends](assets\skills_insights_visualization.jpeg)
*Graph visualizing the top 25 skills needed for a data analyst.*
# What I learned
### Milestone Unlocked:
```
Levelled Up My SQL Skills!

I just wrapped up my deep dive into SQL queries, and it completely changed how I look at data.

Top 3 Takeaways:
Data Structure Matters: Learned how databases organize information using primary and foreign keys.

Filtering with Precision: Mastered WHERE, LIKE, and BETWEEN to extract exactly what I need.

Power of Aggregation: Used GROUP BY and HAVING to turn raw rows into meaningful business insights.
```

# Conclusion
## Insights
```
Core Tooling Dominance: SQL and Excel lead the market by a significant margin, representing the non-negotiable foundational stack for data analytics roles.
Programming Preferences: Python shows higher market demand than R (236 vs 148 postings), while both command comparable six-figure average salary benchmarks.
Premium Niche Skills: Specialized technologies like Snowflake, Go, and Hadoop appear less frequently in postings but command the highest average salary tiers.
BI Tool Comparison: Tableau edges out Power BI in overall job posting demand (230 vs 110 postings), though their average salaries remain closely matched.
```

## Closing Thoughts

```
The Baseline Barrier: The massive volume of SQL and Excel postings proves that technical mastery of foundational tools is critical for entering the field.
Strategic Learning Paths: Aspiring analysts should prioritize high-demand tools first to maximize job opportunity volume before specializing in high-paying niche skills 
Balancing Specialization: Moving forward, I plan to bridge my core PostgreSQL skills with business intelligence tools like Tableau to align directly with the high-demand clusters identified in this dataset.

**TO GOD BE THE GLORY!**

Also BIG THANKYOU to Luke Barousse one of the best instructors for aspiring data analysts.

