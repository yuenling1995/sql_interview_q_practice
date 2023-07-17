/**
Level of Difficulty: Easy
Company: Forbes

Question: Find the most profitable company in the financial sector of the entire world along with its continent

 Thought Process:
1. First use the WHERE clause to filter the dataset and only include records in the financial sector 
2. In order to find the most profitable company, we need to use the max() function on the 'profits' column
3. this can be done via a simple subquery statement

**/


Answer:

select company, 
       continent
from forbes_global_2010_2014
where sector = 'Financials'
and profits = 
    (select max(profits) from forbes_global_2010_2014)
