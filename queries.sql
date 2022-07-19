/*Queries that provide answers to the questions FROM all projects.*/
SELECT
  *
FROM
  animals
WHERE
  name like '%mon';

SELECT
  *
FROM
  animals
WHERE
  date_of_birth between '2016-01-01'
  and '2019-01-01';

SELECT
  *
FROM
  animals
WHERE
  neutered = TRUE
  and escape_attemps < 3;

SELECT
  date_of_birth
FROM
  animals
WHERE
  name in ('Agumon', 'Pikachu');

SELECT
  name,
  escape_attemps
FROM
  animals
WHERE
  weight_kg > 10.5;

SELECT
  *
FROM
  animals
WHERE
  neutered = true;

SELECT
  *
FROM
  animals
WHERE
  name NOT in ('Gabumon');

SELECT
  *
FROM
  animals
WHERE
  weight_kg >= 10.4
  and weight_kg <= 17.3;

SELECT
  COUNT(*)
FROM
  animals;

SELECT
  escape_attemps,
  COUNT(*)
FROM
  animals
WHERE
  escape_attemps = 0
GROUP BY
  escape attemps;

SELECT
  avg(weight_kg)
FROM
  animals;

SELECT
  neutered,
  AVG(escape_attemps)
FROM
  animals
GROUP BY
  neutered;

SELECT
  species,
  MAX(weight_kg),
  MIN(weight_kg)
FROM
  animals
GROUP BY
  species;

SELECT
  species,
  AVG(escape_attemps)
FROM
  animals
WHERE
  date_of_birth > '1990-01-01'
  and date_of_birth < '2000-01-01'
GROUP BY
  species;