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

CREATE TABLE species (
  species_id SERIAL PRIMARY KEY,
  common_name VARCHAR(100) NOT NULL,
  scientific_name TEXT NOT NULL,
  discovery_date DATE NOT NULL,
  conservation_status VARCHAR(100) NOT NULL
);

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
  VALUES  ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
          ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
          ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
          ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

SELECT * FROM species;
