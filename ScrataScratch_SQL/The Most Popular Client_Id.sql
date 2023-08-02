/**
Link: https://platform.stratascratch.com/coding/2029-the-most-popular-client_id-among-users-using-video-and-voice-calls?code_type=1
Level of Difficulty: Hard
Company: Microsoft Apple

Question:
Select the most popular client_id based on a count of the number of users who have 
at least 50% of their events from the following list: 
'video call received', 'video call sent', 'voice call received', 'voice call sent'.

Thought Process:
1. the resule set should be one column only - the client_id
2. we need to compare the counts mentioned in above 4 categories with total counts of event_type,
   and see which ones are >= 50% - then rank them in desc order and find out the largest number
3. so first - count user event records in the 4 listed categories, and count total event_type
      second - divide the two numbers and find out the rate, rank them in desc order
      third - limit results to the ones with rank = 1

**/

Answer:

select sub2.client_id
from
  (select sub.client_id,
         sub.count/sub.total::float as rate,
         rank() over (order by sub.count/sub.total::float desc) as rank
  from 
      (select user_id,
             client_id,
             count(case when event_type in 
                            ('video call received', 'video call sent', 'voice call received', 'voice call sent')
                        then event_id else null end) as count,
             count(event_id) as total
      from fact_events
      group by 1,2
      order by 3 desc) sub ) sub2
where sub2.rate >=0.5
and sub2.rank  = 1











