/**
Link: https://platform.stratascratch.com/coding/9972-find-the-base-pay-for-police-captains?code_type=1
Level of Difficulty: Easy
Company: City of San Francisco

Question: 
Find the base pay for Police Captains.
Output the employee name along with the corresponding base pay.

Thought Process:
1. the result set should include two columns - employeename & basepay
2. we just need to filter the job title to include 'Captain' for Police Captains role.

**/

Answer:
select employeename,
       basepay
from sf_public_salaries
where lower(jobtitle) like '%captain%'
