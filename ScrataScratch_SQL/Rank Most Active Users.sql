/**
Link:
Level of Difficulty: Medium
Company: Airbnb

QUestion:
Rank guests based on the number of messages they've exchanged with the hosts. 
Guests with the same number of messages as other guests should have the same rank. 
Do not skip rankings if the preceding rankings are identical.
Output the rank, guest id, and number of total messages they've sent. 
Order by the highest number of total messages first.

Thought Process:
1. the result set should include - guest_id, # of messages sent, rank
2. we need to find out the total number of sent messages for each guest & rank them in desc order
3. to not skipping the rank, we should use dense_rank() window function

**/

Answer:

select id_guest,
       sum(n_messages) as sum_n_messages,
       dense_rank() over (order by sum(n_messages) desc) as rank
from airbnb_contacts
group by 1
order by 2 desc
