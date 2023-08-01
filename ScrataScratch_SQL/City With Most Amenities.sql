/**
Link: https://platform.stratascratch.com/coding/9633-city-with-most-amenities?code_type=1
Level of Difficulty: Hard
Company: Airbnb

Question:
You're given a dataset of searches for properties on Airbnb. 
For simplicity, let's say that each search result (i.e., each row) represents a unique host. 
Find the city with the most amenities across all their host's properties. Output the name of the city.

Thought Process:
1. the result set should include one column only - city with the most amenities
2. we have an "amenities" column with a string of amenities listed, we need to first change it to an array (string_to_array() function)
   and count the length to find out the number of amenities for each host id
3. then we can use sum() and GROUP BY to find out the total amenities count for each city
4. lastly we can rank them in desc order and select the city with the highest rank!


**/

Answer:

select sub2.city
from 
    (select sub.city,
           sub.count,
           rank() over (order by sub.count desc) as rank
    from 
        (select city,
               sum(array_length(string_to_array(amenities, ','),1)) as count
        from airbnb_search_details
        group by 1
        order by 2 desc) sub) sub2
where sub2.rank = 1



