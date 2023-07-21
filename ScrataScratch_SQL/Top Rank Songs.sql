/**
Link: https://platform.stratascratch.com/coding/9991-top-ranked-songs?code_type=1
Level of Difficulty: Medium
Company: Spotify

Question:
Find songs that have ranked in the top position. 
Output the track name and the number of times it ranked at the top. 
Sort your records by the number of times the song was in the top position in descending order.


Though Process:
1. the result set should include - trackname & number of times its position = 1
2. first we need to limit the songs whose position is 1 only
3. then we can use count() on each song and GROUP BY statement to find out # of times each song stays at the top

**/

Answer:

select trackname,
       count(1) as times_top1
from spotify_worldwide_daily_song_ranking
where position = 1
group by 1
order by 2 desc 
