/**
Link: https://platform.stratascratch.com/coding/10048-top-businesses-with-most-reviews?code_type=1
Level of Difficulty: Easy
Company: Yelp

Question:
Find the top 5 businesses with most reviews. 
Assume that each row has a unique business_id such that the total reviews for each business is listed on each row. 
Output the business name along with the total number of reviews and order your results by the total reviews in descending order.

Thought Process:
1. we can use the window function to rank the review counts for all businesses
2. then select the top 5 business by filtering the rank to be <=5

**/

Answer:

select name,
       review_count
from(
        select name,
               review_count,
               dense_rank() over (order by review_count desc) as rank 
        from yelp_business
    ) sub
where rank <=5
