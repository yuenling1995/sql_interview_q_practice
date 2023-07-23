/**
Link: https://platform.stratascratch.com/coding/10090-find-the-percentage-of-shipable-orders?code_type=1
Level of Difficulty: Medium
Company: Google, Amazon

Question:
Find the percentage of shipable orders.
Consider an order is shipable if the customer's address is known.

Thought Process:
1. the result set should be one column - percentage of shippable orders
2. there are two tables - orders and customers, we need to join them first - use left join here because we want to include all the records 
                                                                             from the orders table
3. we need to divide by the number of orders with address BY the total number of orders
   (1) the total number of orders = count(id) in the orders table
   (2) the number of orders with address = count(address) in the customers table
   (3) then divide the two numbers and times 100 to get the final percentage
   (4) we can use the count() function here because it ignores the null values
**/

Answer:


select (count(address)::decimal /count(id)) * 100 as percent_shipable
       
from 

(select orders.*,
        customers.address
from orders
left join customers
on orders.cust_id = customers.id) sub



