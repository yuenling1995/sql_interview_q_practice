/**
Link: https://platform.stratascratch.com/coding/9622-number-of-bathrooms-and-bedrooms?code_type=1
Level of Difficulty: Easy
Company: Airbnb

Question:
Find the average number of bathrooms and bedrooms for each city’s property types. 
Output the result along with the city name and the property type.

Thought process:
1. the result set should include four columns - city, property_type, avg #of bedrooms, avg # of bathrooms
2. since we have aggreagte function avg(), we need to use GROUP BY - we can group the first two columns
**/

Answer:

select city, 
       property_type,
       avg(bathrooms) as n_bathrooms_avg,
       avg(bedrooms) as n_bedrooms_avg
from airbnb_search_details
group by 1,2
