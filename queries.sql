/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth BETWEEN 'Jan 1, 2016' AND 'Dec 31, 2019';

SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE NAME IN ('Agumon', 'Gabumon');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

    /* query and update*/

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

SELECT * FROM animals;

UPDATE animals
SET species = 'digimon'
WHERE WHERE name LIKE '%mon';
COMMIT;

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE from animals;
ROLLBACK;

SELECT * FROM animals;

DELETE FROM animals 
WHERE date_of_birth > 'Jan 1, 2022';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered ORDER BY COUNT DESC LIMIT 1;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN 'Jan 1, 1990' AND 'Dec 31, 2000' GROUP BY species;

SELECT name FROM owners
JOIN animals
ON owners.id = animals.owner_id
WHERE full_name = 'Melody pond';

SELECT animals.name
FROM species
JOIN animals
ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.name)
FROM species
JOIN animals
ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name
FROM species
JOIN animals
ON species.id = animals.species_id JOIN owners ON owners.id = animals.owner_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Ornwell';

SELECT animals.name
FROM owners
JOIN animals
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name)
FROM owners
JOIN animals
ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT DESC LIMIT 1;

    /* Day4 */

SELECT animals.name
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_vist DESC LIMIT 1;

SELECT COUNT(animals.name)
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name
FROM vets
LEFT JOIN specialization
ON vets.id = specialization.vets_id
LEFT JOIN species
ON species.id = specialization.species_id
ORDER BY vets.id;

SELECT animals.name
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_vist >= '2020-04-1' AND visits.date_of_vist <= '2020-08-30';

SELECT animals.name, COUNT(visits.animal_id)
FROM animals
JOIN visits
ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT DESC LIMIT 1;

SELECT animals.name
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_vist
DESC LIMIT 1;

SELECT animals.*, visits.date_of_vist, vets.*
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
ORDER BY visits.date_of_vist
DESC LIMIT 1;

SELECT vets.name, COUNT(vets.name) AS num_of_visits
FROM vets
LEFT JOIN specialization
ON vets.id = specialization.vets_id
JOIN visits
ON vets.id = visits.vet_id
WHERE specialization.species_id IS NULL
GROUP BY vets.name ORDER BY COUNT(vets.name) DESC;

SELECT species.name AS expected_specialty
FROM animals JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith' GROUP BY species.name
ORDER BY COUNT(DISTINCT animals.name) DESC LIMIT 1;