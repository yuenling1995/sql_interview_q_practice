/**
Link: https://platform.stratascratch.com/coding/2102-flags-per-video?code_type=1
Level of Difficulty: Medium
Company: Google, Netflix

Question:
For each video, find how many unique users flagged it. 
A unique user can be identified using the combination of their first name and last name. 
Do not consider rows in which there is no flag ID.

Thought Process:
1. the result set includes video_id and count of distinct user (user_firstname + user_lastname)
2. we need to first concat the user's first & last name, then count for distinct users
3. in the WHERE clause, exclude null flag IDs

**/

Answer:

select video_id,
       count(distinct concat(coalesce(user_firstname, ''), coalesce(user_lastname,'')))
from user_flags
where flag_id is not null
group by 1
