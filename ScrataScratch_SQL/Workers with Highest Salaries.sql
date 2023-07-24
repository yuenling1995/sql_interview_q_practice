/**
Link: https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=1
Level of Difficulty: Medium
Company: Amazon, Doordash

Question:
You have been asked to find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.

Thought Process:
1. the result set should include the best paid title only
2. there are two tables - worker and title, we need to join them first
3. then select the maximum of salary and embed it as simple subquery in the WHERE clause

**/

Answer:


select title.worker_title as best_paid_title
from worker
join title
on worker.worker_id = title.worker_ref_id
where worker.salary = (select max(salary) from worker)
