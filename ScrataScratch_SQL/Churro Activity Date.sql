/**
Link: https://platform.stratascratch.com/coding/9688-churro-activity-date?code_type=1
Level of Difficulty: Easy
Company: City of Los Angeles

Question: 
Find the activity date and the pe_description of facilities 
with the name 'STREET CHURROS' and with a score of less than 95 points.

Thought Process:
1. this question can be solved with a simple query, result set should include 2 columns - activity_date + pe_description
2. there are 2 conditions to be filtered - facility_name = 'STREET ChHURROS' & score < 95
**/

Answer:
select activity_date,
       pe_description
from los_angeles_restaurant_health_inspections
where facility_name = 'STREET CHURROS'
and score < 95
