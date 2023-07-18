/**
Link: https://platform.stratascratch.com/coding/2056-number-of-shipments-per-month?code_type=1
Level of Difficulty: Easy
Company: Amazon

Question: 
Write a query that will calculate the number of shipments per month. 
The unique key for one shipment is a combination of shipment_id and sub_id. 
Output the year_month in format YYYY-MM and the number of shipments in that month.

Thought Process: 
1. the result set should contain two columns - year_month + count
2. we can use count() to find the distinct values for shipment_id + sub_id
3. the count results should be grouped by year & month in 'YYYY-MM' format
**/

Answer: 
select LEFT(CAST(shipment_date AS varchar), 7) AS year_month,
       COUNT(DISTINCT shipment_id, sub_id) AS count
FROM amazon_shipment
group by 1
