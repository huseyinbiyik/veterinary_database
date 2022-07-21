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

-- Queries for join tables
-- Who was the last animal seen by William Tatcher ?
SELECT
  animals.name
FROM
  animals
  INNER JOIN visits ON animal_id = animals.id
WHERE
  vet_id = 1
ORDER BY
  visits.visit_date DESC
LIMIT
  1;

-- How many different animals did Stephanie Mendez see?
SELECT
  COUNT(*)
FROM
  species
  INNER JOIN specializations ON specializations.species_id = species.id
WHERE
  vet_id = 3;

-- List all vets and their specialties, including vets with no specialties.
SELECT
  species.name,
  vets.name
FROM
  species
  JOIN specializations ON specializations.species_id = species.id
  RIGHT JOIN vets ON specializations.vet_id = vets.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT
  animals.name
FROM
  animals
  JOIN visits ON visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
WHERE
  vets.name = 'Stephanie Mendez'
  AND visits.visit_date BETWEEN '2020-04-01'
  AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT
  animals.name,
  COUNT(*) as total
FROM
  animals
  JOIN visits ON visits.animal_id = animals.id
GROUP BY
  animals.name
ORDER BY
  total DESC
LIMIT
  1;

-- Who was Maisy Smith's first visit?
SELECT
  animals.name,
  visits.visit_date
FROM
  animals
  JOIN visits ON visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
WHERE
  vets.name = 'Maisy Smith'
ORDER BY
  visits.visit_date ASC
LIMIT
  1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT
  animals.name,
  vets.name,
  visits.visit_date
FROM
  animals
  JOIN visits ON visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
ORDER BY
  visits.visit_date DESC
LIMIT
  1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT
  COUNT(*)
FROM
  visits
WHERE
  vet_id = (
    SELECT
      id
    FROM
      vets FULL
      OUTER JOIN specializations ON vets.id = specializations.vet_id
    WHERE
      species_id IS NULL
  );

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT
  species.name,
  COUNT(species.name) as total
FROM
  visits
  INNER JOIN vets ON visits.vet_id = vets.id
  INNER JOIN animals ON visits.animal_id = animals.id
  INNER JOIN species ON animals.species_id = species.id
WHERE
  vets.name = 'Maisy Smith'
GROUP BY
  species.name
ORDER BY
  total DESC
LIMIT
  1;