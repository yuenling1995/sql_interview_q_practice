/**
Link: https://platform.stratascratch.com/coding/10003-lyft-driver-wages?code_type=1
Level of Difficulty: Easy
Company: Lyft

Question: 
Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
Output all details related to retrieved records.

Thought Process:
1. the result se should include all the columns
2. we can use the WHERE statement and OR clause to filter driver's salary - either <= 30K or >= 70K

**/

Answer:
select *
from lyft_drivers
where yearly_salary <= 30000 
or yearly_salary >= 70000









