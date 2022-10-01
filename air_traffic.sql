-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passenger
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE city_country
(
  id SERIAL PRIMARY KEY,
  city_name TEXT,
  country_name TEXT
);

CREATE TABLE plane_schedule
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT NOT NULL REFERENCES airline,
  from_city INT NOT NULL REFERENCES city_country,
  to_city INT NOT NULL REFERENCES city_country
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES passenger,
  plane_schedule_id INT REFERENCES plane_schedule
);


INSERT INTO passenger
  (first_name, last_name, seat)
VALUES
  ('Jennifer', 'Finch', '33B'),
  ('Thadeus', 'Gathercoal', '8A');
 
 INSERT INTO airline
  (name)
VALUES
  ('United'),
  ('British Airways');

 INSERT INTO city_country
  (city_name, country_name)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom');
  
 INSERT INTO plane_schedule
  (departure, arrival, airline_id, from_city, to_city)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4);
 
 INSERT INTO flight
  (passenger_id, plane_schedule_id)
VALUES
  (1, 1),
  (2, 2);
 