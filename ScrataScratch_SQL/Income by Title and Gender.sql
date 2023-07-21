/**
Link: https://platform.stratascratch.com/coding/10077-income-by-title-and-gender?code_type=1
Level of Difficulty: Medium
Company: City of San Francisco

Question:
Find the average total compensation based on employee titles and gender. 
Total compensation is calculated by adding both the salary and bonus of each employee. 
However, not every employee receives a bonus so disregard employees without bonuses in your calculation. 
Employee can receive more than one bonus.
Output the employee title, gender (i.e., sex), along with the average total compensation.

Thought Process:
1. the result set should include - employee title, gender, and average compensation
2. total compensation is salary + bonus
3. employees can have multiple bonuses, so we need to figure out the sum of bonus for each person first
4. then we can join the employee table with bonus results table, 
  use inner join here because we need to exclude employees who don't have a bonus
5. finally we can use GROUP bY and avg() function to find out average compensation for employees based on their title and gender


**/

Answer:

with bonus as (
                select worker_ref_id, 
                       sum(bonus) as bonus
                from sf_bonus
                group by 1
              )
              
select emp.employee_title,
       emp.sex,
       avg(emp.salary + bonus.bonus) as avg_compensation
from sf_employee emp 
join bonus 
on emp.id = bonus.worker_ref_id 
group by 1,2


