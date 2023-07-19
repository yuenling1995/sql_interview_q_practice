/**
Link: https://platform.stratascratch.com/coding/2099-election-results?code_type=1
Level of Difficulty: Easy
Company: Google, Deloitte

Question:
The election is conducted in a city and everyone can vote for one or more candidates, or choose not to vote at all. 
Each person has 1 vote so if they vote for multiple candidates, their vote gets equally split across these candidates. 
For example, if a person votes for 2 candidates, these candidates receive an equivalent of 0.5 vote each.
Find out who got the most votes and won the election. 
Output the name of the candidate or multiple names in case of a tie. 
To avoid issues with a floating-point error you can round the number of votes received by a candidate to 3 decimal places.

Thought Process:
1. the result set should only include one column - the candidate name with the most votes
2. we can split this problem into two different parts - 
   (1) calculate the value of each vote for each candidate
   (2) rank candidates' votes in descending order
   (3) select the candidate with the highest rank in votes
3. to answer the first question - 
   (1) for each voter, we need to count the # of times he/she has voted
   (2) use 1 divide by this value to calculate the voter value for each candidate
   (3) this can be done thru the window function
4. to answer the second question - 
   (1) first we need to sum up the vote values for each candidate and rank them in descending order
   (2) this can be done thru window function dense_rank()
5. to answer the third question - 
   (1) lastly we can select the candidate name with rank = 1


**/

Answer:

select candidate
from (
        select candidate,
               sum(vote_value),
               dense_rank() over (order by sum(vote_value) desc) as rank 
        from (
                select voter,
                       candidate,
                       1.0/count(candidate) over (partition by voter) as vote_value
                from voting_results
                where candidate is not null 
             ) sub
        group by 1
      ) sub2
where sub2.rank = 1



