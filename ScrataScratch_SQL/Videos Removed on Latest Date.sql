/**
Link: https://platform.stratascratch.com/coding/2105-videos-removed-on-latest-date?code_type=1
Level of Difficulty: Hard
Company: Google

Question:
For each unique user in the dataset, find the latest date when their flags got reviewed. 
Then, find total number of distinct videos that were removed on that date (by any user).
Output the the first and last name of the user (in two columns), the date and the number of removed videos. 
Only include these users who had at least one of their flags reviewed by Youtube. If no videos got removed on a certain date, output 0.


Thought Process:
1. the result column should be first_name, last_name, max reviewed date, and # of removed videos
2. there are two tables - user_flags & flag_reviews, we should join them on the common field: flag_id
3. we can create 2 CTEs - first table to find out the max reviewed date, second table to find total removed distinct videos by reviewed dates
4. finally first table LEFT JOIN second table on the reviewed_date, and replace null video counts with 0 by using the coalesce() function

**/

Answer:

with a as (
  select flag.user_firstname,
         flag.user_lastname,
         max(review.reviewed_date)
  from user_flags flag
  join flag_reviews review
  on flag.flag_id = review.flag_id
  where review.reviewed_by_yt = TRUE 
  group by 1,2
),

b as (
  select review.reviewed_date,
         count(distinct flag.video_id)
  from user_flags flag
  join flag_reviews review
  on flag.flag_id = review.flag_id
  where review.reviewed_by_yt = TRUE 
  and review.reviewed_outcome = 'REMOVED'
  group by 1
)

select a.*,
      coalesce(b.count,0)
from a
left join b
on a.max = b.reviewed_date




