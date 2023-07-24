/**
Link: https://platform.stratascratch.com/coding/9942-largest-olympics?code_type=1
Level of Difficulty: Medium
Company: ESPN

Question:
Find the Olympics with the highest number of athletes. 
The Olympics game is a combination of the year and the season, 
and is found in the 'games' column. Output the Olympics along with the corresponding number of athletes.

Thought Process:
1. the result set should include games & number of athletes
2. we should count the number of athletes by games with GROUP BY, and rank them in desc order
3. finally limit the results to rank = 1 only

**/

Answer:


select sub.games,
       sub.athletes_count
from
(select games,
       count(distinct id) as athletes_count,
       dense_rank() over (order by count(id) desc) as rank
from olympics_athletes_events
group by 1) sub
where sub.rank = 1
