SELECT * FROM spotify_db.spotify;


-- Advanced Level



-- 1. Find the top 3 most-viewed tracks for each artist using window functions.

with ranking_artist 
as
(select 
	artist, 
    track,
    sum(views) as total_views ,
	DENSE_RANK() over(partition by artist order by sum(views) desc) as RANK_
from spotify 
group by 1, 2 
order by 1, 3 desc
)
select * from ranking_artist
where rank_<=3
 ;


-- 2. Write a query to find tracks where the liveness score is above the average.

select track, liveness
from spotify
where liveness > (select avg(liveness) from spotify)
;


-- 3. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
with cte
as
(select 
	album,
	max(energy) as highest_energy,
    min(energy) as lowest_energy
from spotify
group by 1)
select 
	album,
    round(highest_energy - lowest_energy, 2) as energy_diff
from cte
order by 2 desc
;


-- 4. Find tracks where the energy-to-liveness ratio is greater than 1.2.
select track, energy/liveness as ratio
from spotify
where energy/liveness > 1.2
order by ratio
;


-- 5. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

SELECT 
    track,
    views,
    likes,
    SUM(likes) OVER (ORDER BY views ASC) AS cumulative_likes
FROM 
    spotify
ORDER BY 
    views;
