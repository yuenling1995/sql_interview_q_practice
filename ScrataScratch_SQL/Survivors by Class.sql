/**
Link: https://platform.stratascratch.com/coding/9881-make-a-report-showing-the-number-of-survivors-and-non-survivors-by-passenger-class?code_type=1
Level of Difficulty: Medium
Company: Tesla

Question:
Make a report showing the number of survivors and non-survivors by passenger class.
Classes are categorized based on the pclass value as:
pclass = 1: first_class
pclass = 2: second_classs
pclass = 3: third_class
Output the number of survivors and non-survivors by each class.

Thought Process:
1. the result set should include four columns - survived, (# count for) first class, second class, third class
2. being grouped by survived(0/1) column, we calculate the number of survivers and victims separately for each class
3. then display the counts horizontally
**/


Answer:

select survived,
       count(case when pclass = 1 then 1 else null end) as first_class,
       count(case when pclass = 2 then 1 else null end) as second_class,
       count(case when pclass = 3 then 1 else null end) as third_class
from titanic
group by 1
