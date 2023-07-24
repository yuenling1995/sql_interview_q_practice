/**
Link: https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?code_type=1
Level of Difficulty: Medium
Company: Airbnb

Question:
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.


Thought Process:
1. the result set is host id & guest id
2. we need to join these two tables on the same gender and nationality
3. then limit ids to distinct records only


**/

Answer:

select distinct a.host_id,
       b.guest_id
from airbnb_hosts a 
join airbnb_guests b 
on a.gender = b.gender
and a.nationality = b.nationality
order by 1
