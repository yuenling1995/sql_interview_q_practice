/**
Link: https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=1
Level of Difficulty: Easy
Company: Microsoft, Amazon

Question: 
Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. 
Output just the absolute difference in salaries.

Thought Process:
1. there are two tables - employee & department. In order to link employee.department_id with the actual department name, 
   let's join these two tables.
2. then we can use subqueries to calculate the max salary in marketing and enginnering department separately
3. and find their absolute difference in the SELECT statement
**/

Answer:
select abs(
           (select max(salary)
           from db_employee emp
           join db_dept dept
           on emp.department_id = dept.id
           where dept.department = 'marketing') - 
           (select max(salary)
           from db_employee emp
           join db_dept dept
           on emp.department_id = dept.id
           where dept.department = 'engineering')
         ) as salary_difference

