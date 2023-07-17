/**
Link: https://platform.stratascratch.com/coding/2119-most-lucrative-products?code_type=1
Level of Difficulty: Easy
Company: Meta/Facebook

Question:
You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 
(from January to June inclusive).
Output their IDs and the total revenue.

Thought Process:
1. the result set should include 2 columns - product id + total revenue
2. there're a few filtering conditions in the WHERE statement:
   (1) 5 most lucrative products - rank total revenue in DESC order and select top 5
   (2) first half of 2022 only: between 2022/01/01 and 2022/06/30

**/

Answer:
select product_id,
       sum(cost_in_dollars * units_sold) as revenue
from online_orders
group by 1
order by 2 desc
limit 5



  
-- the above answers is not very thoughtful since if more than one products has the same revenue 
-- and should be ranked in the same place, only one record will show
-- here's a better idea
/**
1. first calculate the total revenue for each product
2. then rank them in DESC order
3. save as a cte table
4. select only the product id + revenue from the cte table, and pick top 5=
**/
  
with cte as 
(select product_id,
       sum(cost_in_dollars * units_sold) as revenue,
       rank() over (order by sum(cost_in_dollars * units_sold) desc) as rank
     
from online_orders
where extract(month from date) between 1 and 6
group by 1) 

select product_id,
       revenue
from cte 
where rank <= 5











