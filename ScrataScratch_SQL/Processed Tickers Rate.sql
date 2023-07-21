/**
Link: https://platform.stratascratch.com/coding/9781-find-the-rate-of-processed-tickets-for-each-type?code_type=1
Level of Difficulty: Medium
Company: Meta/Facebook

Question:
Find the rate of processed tickets for each type.

Thought Process:
1. the result set should include - type & processed rate for each type
2. we need to find the number of processed tickets, and the number of total tickets for each type
3. and divide # of processed tickets by total tickets to calculate the processed rate


**/

Answer:

with a as (
            select type,
                   count(case when processed = TRUE then 1 else null end) as processed,
                   count(complaint_id) as total
            from facebook_complaints
            group by 1
          )

select a.type,
       cast(a.processed as decimal)/a.total as processed_rate
from a


