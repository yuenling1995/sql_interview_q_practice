/**
Link: https://platform.stratascratch.com/coding/10318-new-products?code_type=1
Level of Difficulty: Medium
Company: Salesforce

Question:
You are given a table of product launches by company by year. 
Write a query to count the net difference between the number of products companies launched in 2020 
with the number of products companies launched in the previous year. 
Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.

Thought Process:
1. the result set should include two columns - the company name & the net difference of products
2. when there is only one table and the question asks us to compare between the two, it's usually a self-join
3. so let's first self join by the company_name, and count the number of unique product_name for the year of 2019 and 2020 separately
4. lastly, count the net difference 


**/

Answer:

select sub.company_name,
       count2 - count1 as net_products
from
    (select launch_first.company_name,
           count(distinct launch_first.product_name) as count1,
           count(distinct launch_next.product_name) as count2
    from car_launches launch_first
    join car_launches launch_next
    on launch_first.company_name = launch_next.company_name
    and launch_next.year - launch_first.year = 1
    group by 1) sub



