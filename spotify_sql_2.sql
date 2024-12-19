SELECT * FROM spotify_db.spotify;

# Medium Level


-- 1. Calculate the average danceability of tracks in each album.

select album, avg(danceability) as avg_danceability 
from spotify 
group by 1 
order by 2 desc;


-- 2. Find the top 5 tracks with the highest energy values.

select track
from spotify
order by energy desc limit 5;



-- 3. List all tracks along with their views and likes where official_video = TRUE.

select track, sum(views) as total_views, sum(likes) as total_likes
from spotify
where official_video='true'
group by track
order by track desc
limit 5;



-- 4. For each album, calculate the total views of all associated tracks.
select album, track, sum(views) as total_album_views
from spotify
group by album, track
order by total_album_views;


-- 5. Retrieve the track names that have been streamed on Spotify more than YouTube.
select track, 
    sum(case when most_playedon= 'spotify' then stream end) as stream_on_spotify
from spotify
group by 1 having stream_on_spotify >0;