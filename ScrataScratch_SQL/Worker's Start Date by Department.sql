/**
Link: https://platform.stratascratch.com/coding/9847-find-the-number-of-workers-by-department?code_type=1
Level of Difficulty: Easy
Company: Amazon

Question:
Find the number of workers by department who joined in or after April.
Output the department name along with the corresponding number of workers.
Sort records based on the number of workers in descending order.

Thought Process:
1. the result set should include two columns - department & employee count
2. we can use GROUP BY to count # of employees by each department
3. also need to filter results to include joining month >= April in WHERE clause
**/

Answer:
select department,
       count(worker_id) as num_workers
from worker
where extract(month from joining_date) >=4
group by 1
order by 2 desc
