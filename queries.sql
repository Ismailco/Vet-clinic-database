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