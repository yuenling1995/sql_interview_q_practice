/**
Link: https://platform.stratascratch.com/coding/9817-find-the-number-of-times-each-word-appears-in-drafts?code_type=1
Level of Difficulty: Medium
Company: Google

Question:
Find the number of times each word appears in drafts.
Output the word along with the corresponding number of occurrences.

Thought Process:
1. the result set should include two columns - each word & number of occurences
2. we need to filter filename so it includes drafts only
3. then we need to tokenize the text into words for each draft and count their number of appearences separately
   (1) use trim() to exclude periods '.'
   (2) use replace() to replace commas ',' with empty spaces 
   (3) use string_to_array() to split the cleaned string on the 'empty space' delimiter, and returns an array
   (4) use unnest() to return a result table with a row of each word in the array
   (5) count the number of times each word appears, use GROUP BY since it's an aggregate function

**/

Answer:

select 
    unnest(string_to_array(replace(trim(both '.' from contents), ',', ''), ' ')) as word,
    count(1) as nentry
from google_file_store
where filename like 'draft%'
group by 1
