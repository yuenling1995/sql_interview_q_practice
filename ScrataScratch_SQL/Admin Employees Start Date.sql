/**
Link: https://platform.stratascratch.com/coding/9845-find-the-number-of-employees-working-in-the-admin-department?code_type=1
Level of Difficulty: Easy
Company: Amazon, Microsoft

Question:
Find the number of employees working in the Admin department that joined in April or later.

Thought Process:
1. the result set should include one column only - employee count
2. this question can be solved with a simple query, filter 2 conditions: belong to Admin & joining_date > April
**/

Answer:
select count(worker_id) as n_admins
from worker 
where department = 'Admin'
and extract(month from joining_date) >= 4
