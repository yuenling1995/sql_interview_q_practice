/**
Link: https://platform.stratascratch.com/coding/10166-reviews-of-hotel-arena?code_type=1
Level of Difficulty: Easy
Company: Airbnb, Expedia

Question:
Find the number of rows for each review score earned by 'Hotel Arena'. 
Output the hotel name (which should be 'Hotel Arena'), 
review score along with the corresponding number of rows with that score for the specified hotel.

Thought Process:
1. the result set should include three columns - hotel_name, reviewer_score, # of rows
2. in the WHERE clause, limit results to include hotel_name = 'Hotel Arena' only
3. use count() and GROUP BY since there is aggregate function

**/

Answer:

select hotel_name,
       reviewer_score,
       count(*)

from hotel_reviews
where hotel_name = 'Hotel Arena'
group by 1,2
