/**
Link:
Level of Difficulty: Easy
Company: Doordash, Lyft

Question:
Find the last time each bike was in use. 
Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned). 
Order the results by bikes that were most recently used.

Thought Process:
1. the result set should include two columns - bike_number & last time it was used
2. we can use max() to finc out the latest datetime each bike was used
3. since it's aggregate function, remember to GROUP BY each bike_number
**/

Answer:

select bike_number,
       max(end_time) as last_used
from dc_bikeshare_q1_2012
group by 1
order by 2 desc
