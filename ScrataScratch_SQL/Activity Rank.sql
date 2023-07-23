/**
Link:
Level of Difficulty: Medium
Company:

Question:
Find the email activity rank for each user. 
Email activity rank is defined by the total number of emails sent. 
The user with the highest number of emails sent will have a rank of 1, and so on. 
Output the user, total emails, and their activity rank. 
Order records by the total emails in descending order. 
Sort users with the same number of emails in alphabetical order.
In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails. 
For tie breaker use alphabetical order of the user usernames.

Thought Process:
1. the result set should include three columns - user id, number of total emails sent, their activity rank
2. first find out the total number of emails sent with count(id)
3. next rank each user's total sent emails in descending order, also asc order in terms of user id
4. then put everything together with a GROUP BY clause & same order by statements

**/


Answer:

select from_user,
       count(id) as total_emails,
       row_number() over (order by count(id) desc, from_user) as row_number
from google_gmail_emails
group by 1
order by 2 desc, 1

