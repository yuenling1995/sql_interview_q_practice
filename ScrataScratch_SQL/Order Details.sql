/**
Link: https://platform.stratascratch.com/coding/9913-order-details?code_type=1
Level of Difficulty: Easy
Company: Amazon, Shopify

Question:
Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.

Thought Process:
1. there are 2 tables - customers and orders
2. the result set should include 4 columns - first_name, order_date, order_details, total_order_cost
3. we need to join the two tables by linking field - customer id
4. the joining results should also only include customers first_name in ('Jill', 'Eva')
**/

Answer:

select customers.first_name,
       orders.order_date,
       orders.order_details,
       orders.total_order_cost
from customers
join orders
on customers.id = orders.cust_id
where customers.first_name in ('Jill', 'Eva')
order by customers.id 
