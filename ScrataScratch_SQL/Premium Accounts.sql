/**
Link: https://platform.stratascratch.com/coding/2097-premium-acounts?code_type=1
Level of Difficulty: Medium
Company: Meta/Facebook

Question:
You are given a dataset that provides the number of active users per day per premium account. 
A premium account will have an entry for every day that it’s premium. 
However, a premium account may be temporarily discounted and considered not paid, 
this is indicated by a value of 0 in the final_price column for a certain day. 
Find out how many premium accounts that are paid on any given day are still premium and paid 7 days later.
Output the date, the number of premium and paid accounts on that day, 
and the number of how many of these accounts are still premium and paid 7 days later. 
Since you are only given data for a 14 days period, only include the first 7 available dates in your output.

Thought Process:
1. the result set should include entry_date, # of premium & paid accounts on first day, # of premium & paid acc 7 days later
2. we need to use self join to compare between premium accounts before pay & premium accounts after pay 7 days later
3. we need to make sure these accounts are still premium by setting final_price > 0
4. after joining, we will have one column indicates a list of account_id before pay
    & another column for a list of account_id after pay
5. then we can count that on each date, the number of accounts that are premium and paid, 
   & number of accounts that are still premium and paid 7 days later.
6. finally we can select the top 7 records for the first 7 dates
**/

Answer:
select before_pay.entry_date,
       count(before_pay.account_id) as premium_paid_accounts,
       count(after_pay.account_id) as premium_paid_accounts_7d
from premium_accounts_by_day before_pay
left join premium_accounts_by_day after_pay
      on before_pay.account_id = after_pay.account_id
      and after_pay.final_price > 0
      and datediff(after_pay.entry_date, before_pay.entry_date) = 7
-- self join first, then limit results to include final_price > 0, which are paid premium acc only
where before_pay.final_price > 0
group by 1
order by 1
limit 7






