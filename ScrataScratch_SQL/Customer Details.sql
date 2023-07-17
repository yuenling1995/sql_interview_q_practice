/**
Link: https://platform.stratascratch.com/coding/9891-customer-details?code_type=1
Level of Difficulty: Easy
Company: Apple & Amazon

Question: 
Find the details of each customer regardless of whether the customer made an order. 
Output the customer's first name, last name, and the city along with the order details.
You may have duplicate rows in your results due to a customer ordering several of the same items. 
Sort records based on the customer's first name and the order details in ascending order.


Thought Process:
1. there are 2 tables - customer and orders, we need to left join the customer table with orders to include all the customers
2. join the 2 tables based on customer id
3. 4 columns should be displayed in the result set - first name, last name, city, order details
4. also sort results by the first name & order details


**/


Answer: 
select customers.first_name,
       customers.last_name,
       customers.city,
       orders.order_details
from customers
left join orders
on customers.id = orders.cust_id
order by 1,4







