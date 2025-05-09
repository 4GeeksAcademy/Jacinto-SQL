-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


SELECT regions.name, regions.country, COUNT(DISTINCT species.id) AS num_especies
FROM observations
JOIN species ON observations.species_id
JOIN regions ON observations.region_id
GROUP BY regions.name, regions.country
ORDER BY num_especies DESC;


SELECT strftime('%m', observations.observation_date) AS mes, COUNT(*) AS num_observaciones
FROM observations
GROUP BY mes
ORDER BY num_observaciones DESC;


SELECT species.scientific_name, species.common_name, COUNT(*) AS num_registros
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species_id
HAVING num_registros < 10
ORDER BY num_registros ASC;


SELECT regions.name, regions.country, COUNT(DISTINCT observations.species_id) AS especies_diferentes
FROM observations
JOIN regions ON observations.region_id = regions.id
GROUP BY region.name, regions.country
ORDER BY especies_diferentes DESC
LIMIT 1;


SELECT species.scientific_name, species.common_name, COUNT(*) AS num_observaciones
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.scientific_name, species.common_name
ORDER BY num_observaciones DESC
LIMIT 5;


SELECT observations.observer, COUNT(*) AS num_registros
FROM observations
GROUP BY observations.observer
ORDER BY num_registros DESC
LIMIT 10;


SELECT species.scientific_name, species.common_name
FROM species
WHERE species.scientific_name NOT IN (SELECT DISTINCT species.scientific_name FROM observations);


SELECT observations.observation_date, COUNT(DISTINCT observations.species_id) AS especies_observadas
FROM observations
GROUP BY observations.observation_date
ORDER BY especies_observadas DESC
LIMIT 5;