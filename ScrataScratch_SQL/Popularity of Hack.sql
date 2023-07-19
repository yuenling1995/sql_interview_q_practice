/**
Link: https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=1
Level of Difficulty: Easy
Company: Meta/Facebook

Question:
Meta/Facebook has developed a new programing language called Hack.
To measure the popularity of Hack they ran a survey with their employees. 
The survey included data on previous programing familiarity as well as the number of years of experience, age, gender 
and most importantly satisfaction with Hack. 
Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location.
Luckily the user IDs of employees completing the surveys were stored.
Based on the above, find the average popularity of the Hack per office location.
Output the location along with the average popularity.


Thought Process:
1. there are two tables - employee & survey
2. we should join them by the linking field - employee id
3. since avg() is aggregate function, we can find the average popularity by location via GROUP BY
**/

Answer:

select emp.location,
       avg(survey.popularity)
from facebook_employees emp 
join facebook_hack_survey survey 
on emp.id = survey.employee_id
group by 1
