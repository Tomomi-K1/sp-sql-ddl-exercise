-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artist
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL 
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);


CREATE TABLE producer
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT NOT NULL REFERENCES album
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

INSERT INTO artist
  (artist_name)
VALUES
  ('Hanson'),
  ('Test Singer'),
  ('Queen');

INSERT INTO album
  (title)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera');

INSERT INTO producer
  (producer_name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker');

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2);

  INSERT INTO song_artist
  (song_id, artist_id)
VALUES
  (1, 1),
  (1, 3),
  (2, 2);

  INSERT INTO song_producer
  (song_id, producer_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3);