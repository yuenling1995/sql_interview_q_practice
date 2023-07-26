/**
Link: https://platform.stratascratch.com/coding/10026-find-all-wineries-which-produce-wines-by-possessing-aromas-of-plum-cherry-rose-or-hazelnut?code_type=1
Level of Difficulty: Medium
Company: Wine Magazine


Question:
Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut. 
To make it more simple, look only for singular form of the mentioned aromas. 
HINT: if one of the specified words is just a substring of another word, this should not be a hit, but a miss.

Example Description: Hot, tannic and simple, with cherry jam and currant flavors 
accompanied by high, tart acidity and chile-pepper alcohol heat.
Therefore the winery Bella Piazza is expected in the results.

Thought Process:
1. use regular expression to solve this question
2. embed the keywords in the search condition

**/

Answer:

select winery
from winemag_p1
where lower(description) ~ '\y(plum|cherry|rose|hazelnut)\y'






