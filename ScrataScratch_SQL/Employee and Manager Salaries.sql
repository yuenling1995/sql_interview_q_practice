/**
Link:
Level of Difficulty: Medium
Company: 

Question:
Find employees who are earning more than their managers. Output the employee's first name along with the corresponding salary.

Thought Prcoess:
1. the result set should include two columns - first_name & salary
2. when there is only one table and the question asks us to compare between two things, it's usually a self join 
3. so let's first self join the table (emp & manager table)
4. we can use the columns "id" and "manager_id" to link up the table:
   (1) In "manager" table, the id should be "employee" table's manager_id
5. then in the WHERE clause, we can filter results to only include records that employee's salary > manager's salary

**/

Answer:
  
select emp.first_name,
       emp.salary
from employee emp 
join employee manager
on manager.id = emp.manager_id
and emp.salary > manager.salary
