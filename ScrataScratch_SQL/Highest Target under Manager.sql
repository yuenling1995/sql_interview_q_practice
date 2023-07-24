/**
Link: https://platform.stratascratch.com/coding/9905-highest-target-under-manager?code_type=1
Level of Difficulty: Medium
Company: Salesforce

Question:
Find the highest target achieved by the employee or employees who works under the manager id 13. 
Output the first name of the employee and target achieved. 
The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

Thought Process:
1. the result set should include two columns - first name & target
2. first limit the data to include manager_id = 13 only
3. then select the highest target and embed it in the WHERE clause as a simple subquery



**/

Answer:

select first_name,
       target
from salesforce_employees
where manager_id = 13
and target in (select max(target) 
               from salesforce_employees
               where manager_id = 13)
