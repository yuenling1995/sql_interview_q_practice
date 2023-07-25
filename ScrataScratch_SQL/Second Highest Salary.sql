/**
Link: https://platform.stratascratch.com/coding/9892-second-highest-salary?code_type=1
Level of Difficulty: Medium
Company: Google, Apple

Question:
Find the second highest salary of employees.

Thought Process:
1. the result set should include one column only - salary
2. first rank the employee salary in desc order and embed in a simple subquery
3. then select the salary with rank = 2

**/

Answer:

select sub.salary
from
(select id,
       salary,
       dense_rank() over (order by salary desc) as rank 
from employee) sub
where rank = 2

