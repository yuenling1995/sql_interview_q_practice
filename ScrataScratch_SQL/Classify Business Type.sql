/**
Link: https://platform.stratascratch.com/coding/9726-classify-business-type?code_type=1
Level of Difficulty: Medium
Company: City of San Francisco

Question:
Classify each business as either a restaurant, cafe, school, or other.

•	A restaurant should have the word 'restaurant' in the business name.
•	A cafe should have either 'cafe', 'café', or 'coffee' in the business name.
•	A school should have the word 'school' in the business name.
•	All other businesses should be classified as 'other'.

Output the business name and their classification.

Thought Process:
1. The result set should include two columns only - business name & classification
2. we can use CASE statement to perform the classification for each restaurant
3. remember to select distinct business_name only


**/

Answer:

select distinct business_name,
       case when business_name ilike '%restaurant%' then 'restaurant'
            when business_name ilike '%cafe%' then 'cafe'
            when business_name ilike '%café%' then 'cafe'
            when business_name ilike '%coffee%' then 'cafe'
            when business_name ilike '%school%' then 'school'
        else 'other' end as business_type

from sf_restaurant_health_violations
       
