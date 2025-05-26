-- Active: 1747889982201@@127.0.0.1@5432@conservation_db

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);

INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );

SELECT * FROM rangers;

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(100) NOT NULL
);

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

SELECT * FROM species;

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species (species_id),
    ranger_id INT REFERENCES rangers (ranger_id),
    location TEXT NOT NULL,
    sighting_time TIMESTAMP without TIME zone NOT NULL,
    notes TEXT
);

INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

SELECT * FROM sightings;

-- 01. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-- 02. Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) as unique_species_count
FROM sightings;

-- 03. Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location LIKE ('%Pass%')

-- 04. List each ranger's name and their total number of sightings.
SELECT name, total_number
FROM (
        SELECT ranger_id, rangers.name, count(ranger_id) as total_number
        FROM rangers
            JOIN sightings USING (ranger_id)
        GROUP BY
            ranger_id
    )

-- 05. List species that have never been sighted.
SELECT common_name
FROM species
WHERE
    species_id NOT in (
        SELECT species_id
        FROM sightings
    );

-- 06. Show the most recent 2 sightings.
SELECT species.common_name, sightings.sighting_time, rangers.name
FROM
    sightings
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
    JOIN species ON sightings.species_id = species.species_id
ORDER BY sighting_time DESC
LIMIT 2;

-- 07. Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    EXTRACT(
        YEAR
        FROM discovery_date
    ) < 1800;

-- 08. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT
    sighting_id,
    CASE
        WHEN sighting_time::time < '12:00:00' THEN 'Morning'
        WHEN sighting_time::time < '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- 09. Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE
    ranger_id NOT IN (
        SELECT ranger_id
        FROM sightings
    );