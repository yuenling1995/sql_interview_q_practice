/**
Link: https://platform.stratascratch.com/coding/9917-average-salaries?code_type=1
Level of Difficulty: Easy
Company: Salesforce, Glassdoor

Question:
Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

Thought Process:
1. the result set should include four columns - department, first_name, salary, avg(salary) per department
2. we can use window function to group the avg(salary) by department only (without GROUP BY)


**/

Answer:

select department,
       first_name,
       salary,
       avg(salary) over (partition by department) as avg
from employee
