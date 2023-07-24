/**
Link: https://platform.stratascratch.com/coding/10304-risky-projects?code_type=1
Level of Difficulty: Medium
Company: LinkedIn

Question:
Identify projects that are at risk for going overbudget. 
A project is considered to be overbudget if the cost of all employees assigned to the project is greater than the budget of the project.

You'll need to prorate the cost of the employees to the duration of the project. 
For example, if the budget for a project that takes half a year to complete is $10K, 
then the total half-year salary of all employees assigned to the project should not exceed $10K. 
Salary is defined on a yearly basis, so be careful how to calculate salaries for the projects that last less or more than one year.

Output a list of projects that are overbudget with their project name, project budget, 
and prorated total employee expense (rounded to the next dollar amount).

HINT: to make it simpler, consider that all years have 365 days. You don't need to think about the leap years.

Thought Process:
1. there are three tables and we need to join them first - linkedin_projects, linkedin_emp_projects, linkedin_employees
2. then we calculate the total project cost - sum of salary * project duration
3. next compare the total project cost to the budget and find out the overbudget projects

**/

Answer:
select sub3.title,
       sub3.budget,
       sub3.prorated_employee_expense
from
    (select sub2.title,
           sub2.budget,
           sub2.end_date,
           sub2.start_date,
           ceiling(datediff(end_date, start_date) * (sum(salary)/365)) as prorated_employee_expense
    from
        (select linkedin_projects.*,
               sub.salary
        from linkedin_projects
        left join
                (select *
                from linkedin_emp_projects
                left join linkedin_employees
                on linkedin_emp_projects.emp_id = linkedin_employees.id) sub 
        on linkedin_projects.id = sub.project_id) sub2
    group by 1,2,3,4
    order by 1) sub3
where sub3.prorated_employee_expense > sub3.budget











