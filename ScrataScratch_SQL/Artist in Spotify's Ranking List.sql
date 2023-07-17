/** 
Link: https://platform.stratascratch.com/coding/9992-find-artists-that-have-been-on-spotify-the-most-number-of-times?code_type=1
Level of Difficulty: Easy
Company: Spotify

Question: 
Find how many times each artist appeared on the Spotify ranking list
Output the artist name along with the corresponding number of occurrences.
Order records by the number of occurrences in descending order.

Thought Process:
1. the result table should only include 2 columns - artist name + number of occurences
2. we can use a GROUP BY statement and count() function
3. then order results in DESC order



**/

Answer:

select artist,
       count(1)
from spotify_worldwide_daily_song_ranking
group by 1
order by 2 desc

