/**
Link: https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=1
Level of Difficulty: Medium
Company: Amazon, Doordash

Question:
You have been asked to find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.

Though Process:
1. there are two tables - worker & title
2.the result set should include - best_paid_title
3. we need to left join the worker table with title table to get the title for each worker
4. then we can select the best paid title by a simple subquery - max(salary) in the WHERE statement


**/

Answer:

select title.worker_title as best_paid_title
from worker
left join title
on worker.worker_id = title.worker_ref_id
where salary = (select max(salary) from worker)
