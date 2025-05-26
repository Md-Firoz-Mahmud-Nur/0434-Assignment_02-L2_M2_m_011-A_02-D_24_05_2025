-- Active: 1747889982201@@127.0.0.1@5432@conservation_db
CREATE DATABASE conservation_db;

CREATE TABLE rangers (
  ranger_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  region VARCHAR(100) NOT NULL
);

INSERT INTO rangers (name, region)
  VALUES  ('Alice Green', 'Northern Hills'),
          ('Bob White', 'River Delta'),
          ('Carol King', 'Mountain Range');


SELECT * FROM rangers;
