-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE center_of_orbit
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL 
);

CREATE TABLE space_description
(
 id SERIAL PRIMARY KEY,
 planet_id INT REFERENCES planets,
 orbit_id INT REFERENCES center_of_orbit,
 galaxy TEXT NOT NULL,
 moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);


  INSERT INTO center_of_orbit
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');


    INSERT INTO space_description 
  (planet_id, orbit_id, galaxy, moons)
VALUES
  (1, 1, 'Milky Way', '{"The Moon"}'),
  (2, 1, 'Milky Way', '{"Phobos", "Deimos"}'),
  (3, 1, 'Milky Way', '{}'),
  (4, 1, 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  (5, 2, 'Milky Way', '{}'),
  (6, 3, 'Milky Way', '{}');