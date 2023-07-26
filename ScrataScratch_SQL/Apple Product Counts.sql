/**
Link: https://platform.stratascratch.com/coding/10141-apple-product-counts?code_type=1
Level of Difficulty:
Company: Google, Apple

Question:
Find the number of Apple product users and the number of total users with a device and group the counts by language. 
Assume Apple products are only MacBook-Pro, iPhone 5s, and iPad-air. 
Output the language along with the total number of Apple users and users with any device. 
Order your results based on the number of total users in descending order.

Thought Process:
1. the result set should include three columns - language, count of apple users, count of total users 
2. we need to count them separately by languages, and apple users should include the above-mentioned devices only 
3. let's join these two tables first, then count the number of users separately by language (GROUP BY)
4. and finally sort them in desc order based on the total number of users


**/

Answer:

select users.language,
       count(distinct case when event.device in ('iphone 5s', 'macbook pro', 'ipad air') 
                      then users.user_id else null end) as n_apple_users,
       count(distinct users.user_id) as n_total_users
from playbook_events event
join playbook_users users
on event.user_id = users.user_id
group by 1
order by 3 desc










