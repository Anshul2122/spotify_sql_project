create database spotify_DB;

use spotify_DB;

DROP TABLE IF EXISTS spotify;

CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes FLOAT,
    comments FLOAT,
    licensed VARCHAR(5),
    official_video VARCHAR(5),
    stream FLOAT,
    energy_liveness FLOAT,
    most_playedon VARCHAR(50) 
);

select * from spotify;

