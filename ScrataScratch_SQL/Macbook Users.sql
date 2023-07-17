/**
Link: https://platform.stratascratch.com/coding/9653-count-the-number-of-user-events-performed-by-macbookpro-users?code_type=1
Level of Difficulty: Easy
Company: Apple

Question:
Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.

Thought Process:
1. the result set should include 2 columns - event name + number of events
2. we need to filter the records and include Mac users only - WHERE statement here
3. we can use the GROUP BY clause and count() function to count number of events
4. finally filter the results by count in DESC



**/

Answer:
select event_name,
       count(1) 
from playbook_events
where device = 'macbook pro'
group by 1
order by 2 desc
       



