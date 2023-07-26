/**
Link: https://platform.stratascratch.com/coding/10048-top-businesses-with-most-reviews?code_type=1
Level of Difficulty: Medium
Company: Yelp

Question:
Find the top 5 businesses with most reviews. 
Assume that each row has a unique business_id such that the total reviews for each business is listed on each row. 
Output the business name along with the total number of reviews and order your results by the total reviews in descending order.


Thought Process:
1. the result set should include two columns - business_name and total review_count
2. we should first rank the review_count in desc order for each business, then embed it as simple subquery
3. finally exclude the rank column, and filter results to show the top 5 business only

**/

Answer:

select sub.name,
       sub.review_count
from
        (select name,
               review_count,
               dense_rank() over (order by review_count desc) as rank
        from yelp_business) sub
where sub.rank <=5



