/**
Link: https://platform.stratascratch.com/coding/2104-user-with-most-approved-flags?code_type=1
Level of Difficulty: Medium
Company: Google

Question:
Which user flagged the most distinct videos that ended up approved by YouTube? 
Output, in one column, their full name or names in case of a tie. 
In the user's full name, include a space between the first and the last name.

Thought Process:
1. the result set should include the user's full name - first name + last name
2. there are two tables "user_flags" & "flag_review", we need to join them first by flag_id
3. then we should concat the name columns and count distinct approved videos, and rank them in desc order
   (1) concat user_firstname and user_lastname
   (2) count distinct video_id where reviewed_outcome = 'APPROVED'
   (3) rank count results in desc order
   (4) embed in a subquery
4. finally only include the username (fullname) where rank = 1

**/

Answer:

select sub.username
from
    (select concat(coalesce(flag.user_firstname, ''), ' ', coalesce(flag.user_lastname, '')) as username,
           dense_rank() over (order by count(distinct flag.video_id) desc) as rank
    from user_flags flag
    right join flag_review review
    on flag.flag_id = review.flag_id
    where review.reviewed_outcome = 'APPROVED'
    group by 1) sub
where sub.rank = 1






