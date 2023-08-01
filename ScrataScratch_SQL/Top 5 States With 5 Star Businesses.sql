/**
Link: https://platform.stratascratch.com/coding/10046-top-5-states-with-5-star-businesses?code_type=1
Level of Difficulty: Hard
Company: Yelp

Question:
Find the top 5 states with the most 5 star businesses. 
Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. 
In case there are ties in the number of businesses, return all the unique states. 
If two states have the same result, sort them in alphabetical order.

Thought Process:
1. the result set should include state and count of 5-star businesses
2. we can first count how many 5-star businesses we have for each state, then rank them in desc order
3. and then limit results to rank<=5

**/

Answer:

select sub2.state, 
       sub2.count as n_businesses
from 
    (select sub.state,
           sub.count,
           dense_rank() over (order by sub.count desc) as rank 
    from
        (select state,
               count(business_id) as count
        from yelp_business
        where stars = 5
        group by 1
        order by 2 desc) sub ) sub2
where sub2.rank <=5
order by 2 desc, 1




