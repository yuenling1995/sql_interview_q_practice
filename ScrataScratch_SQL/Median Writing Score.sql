/**
Link: https://platform.stratascratch.com/coding/9610-find-students-with-a-median-writing-score?code_type=1
Level of Difficulty: Medium
Company: Kaplan, Google

Question:
Output ids of students with a median score from the writing SAT.

Thought Process:
1. the result set is just one column - student id 
2. we need to find the median sat_writing score by percentile_cont()
3. embed it in the WHERE clause as a simple subquery, to include students with this score only

**/

Answer:
SELECT student_id
from sat_scores
where sat_writing = (
                        select percentile_cont(0.5) within group(order by sat_writing) 
                        FROM sat_scores
                     )
