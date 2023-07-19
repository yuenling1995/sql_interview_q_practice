/**
Link: https://platform.stratascratch.com/coding/10128-count-the-number-of-movies-that-abigail-breslin-nominated-for-oscar?code_type=1
Level of Difficulty: Easy
Company: Google, Netflix

Question:
Count the number of movies that Abigail Breslin was nominated for an oscar.

Thought Process:
1. the result should only be a number - use count() to find out the nominated count
2. filter results to include Abigail only in the WHERE clause


**/

Answer:

select count(id)
from oscar_nominees
where nominee = 'Abigail Breslin'
