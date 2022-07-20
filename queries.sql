/*Queries that provide answers to the questiONs FROM all projects.*/
SELECT
  *
FROM
  animals
WHERE
  name like '%mON';

SELECT
  *
FROM
  animals
WHERE
  date_of_birth between '2016-01-01'
  AND '2019-01-01';

SELECT
  *
FROM
  animals
WHERE
  neutered = TRUE
  AND escape_attemps < 3;

SELECT
  date_of_birth
FROM
  animals
WHERE
  name in ('AgumON', 'Pikachu');

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
  name NOT in ('GabumON');

SELECT
  *
FROM
  animals
WHERE
  weight_kg >= 10.4
  AND weight_kg <= 17.3;

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
  AND date_of_birth < '2000-01-01'
GROUP BY
  species;

-- join table queries
SELECT
  name,
  full_name
FROM
  animals
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE
  full_name = 'Melody Pond';

SELECT
  animals.name,
  species.name
FROM
  animals
  INNER JOIN species ON animals.species_id = species.id
WHERE
  species.id = 1;

SELECT
  animals.name,
  owners.full_name
FROM
  animals
  right join owners ON animals.owner_id = owners.id;

SELECT
  species.name,
  COUNT(*)
FROM
  animals
  INNER JOIN species ON animals.species_id = species.id
GROUP BY
  species.name;

SELECT
  animals.name
FROM
  animals
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE
  owners.id = 2;

SELECT
  animals.name
FROM
  animals
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE
  owners.id = 5
  AND escape_attemps = 0;

SELECT
  owners.full_name,
  COUNT(*) AS total
FROM
  animals
  INNER JOIN owners ON animals.owner_id = owners.id
GROUP BY
  owners.full_name
ORDER BY
  total DESC
LIMIT
  1;