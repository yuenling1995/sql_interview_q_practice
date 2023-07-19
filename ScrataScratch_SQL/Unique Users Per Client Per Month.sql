/**
Link: https://platform.stratascratch.com/coding/2024-unique-users-per-client-per-month?code_type=1
Level of Difficulty: Easy
Company: Apple, Dell, Microsoft

Question:
Write a query that returns the number of unique users per client per month

Thought Process:
1. the result set should include three columns - client_id, month #, client_id count
2. to find out the number of unique users per client & per month, we can use count(distinct) and GROUP BY

**/

Answer:

select client_id,
       extract(month from time_id),
       count(distinct user_id)
from fact_events
group by 1,2;
