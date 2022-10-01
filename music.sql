-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artist
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
  
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE producer
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT NOT NULL REFERENCES album,
  producer_id INT NOT NULL REFERENCES producer
);

CREATE TABLE song_artist
(
  song_id INT NOT NULL REFERENCES songs,
  artist_id INT NOT NULL REFERENCES artist
);

CREATE TABLE song_producer
(
  song_id INT NOT NULL REFERENCES songs,
  producer_id INT NOT NULL REFERENCES producer
);

