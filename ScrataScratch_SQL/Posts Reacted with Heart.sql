/**
Link: https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?code_type=1
Level of Difficulty: Easy
Company: Meta/Facebook

Question:
Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

Thought Process:
1. there are two tables - facebook_reactions & facebook_posts with a linking field 'post_id'
2. we need to select all the columns from facebook_reactions table
3. the filtering condition should be - facebook_reactions.reaction = 'heart', which can be done via a subquery in the WHERE clause 

**/

Answer:

select *
from facebook_posts
where post_id in (
                    select post_id
                    from facebook_reactions
                    where reaction = 'heart')
