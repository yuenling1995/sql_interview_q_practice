/**
Link: https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality?code_type=1
Level of Difficulty: Medium
Company: Airbnb

Question:
Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.

Thought Process:
1. the result set should include nationality & number of apartments owned
2. there are two tables, we should join them first
3. then limit our results to unit_type = 'Apartment' and age < 30
4. next count the number of apartments by nationality with GROUP BY - count distinct unit_id


**/

Answer:

select host.nationality,
       count(distinct unit_id) as apartment_count
from airbnb_units unit
left join airbnb_hosts host
on unit.host_id = host.host_id
where host.age < 30
and unit.unit_type = 'Apartment'
and host.nationality is not null
group by 1
order by 2 desc



