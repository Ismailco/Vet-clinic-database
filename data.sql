/* Populate database with sample data. */

INSERT INTO 
    animals (
        id,
        name,
        date_of_birth,
        weight_kg, neutered,
        escape_attempts )
    values(
        1,
        'Agumon',
        'Feb 3, 2020',
        10.23,
        true,
        0 );

INSERT INTO 
    animals (
        id,
        name,
        date_of_birth,
        weight_kg, neutered,
        escape_attempts )
    values(
        2,
        'Gabumon',
        'Nov 15, 2018',
        8,
        true,
        2 );

INSERT INTO 
    animals (
        id,
        name,
        date_of_birth,
        weight_kg, neutered,
        escape_attempts )
    values(
        3,
        'Pikachu',
        'Jan 7, 2021',
        15.04,
        false,
        1 );

INSERT INTO 
    animals (
        id,
        name,
        date_of_birth,
        weight_kg, neutered,
        escape_attempts )
    values(
        4,
        'Devimon',
        'May 12, 2017',
        11,
        true,
        5 );

    /* Query and update*/

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts)
VALUES (
    5,
    'Charmander',
    'Feb 8, 2020',
    -11,
    false,
    0);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts)
VALUES (
    6,
    'Plantmon',
    'Nov 15, 2021',
    -5.7,
    true,
    2);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts)
VALUES (
    7,
    'Squirtle',
    'Apr 2, 1993',
    -12.13,
    false,
    3);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts)
VALUES (
    8,
    'Angemon',
    'Jun 12, 2005',
    -45,
    true,
    1);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts)
VALUES (
    9,
    'Boarmon',
    'Jun 7, 2005',
    20.4,
    true,
    7);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts)
VALUES (
    10,
    'Blossom',
    'Oct 13, 1998',
    17,
    true,
    3);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts)
VALUES (
    11,
    'Ditto',
    'May 14, 2022',
    22,
    true,
    4);

    /* Day3 */

INSERT INTO owners(
  full_name,
  age)
VALUES(
    'Sam Smith',
    34);

INSERT INTO owners(
  full_name,
  age)
VALUES(
    'Jennifer Ornwell',
    19);

INSERT INTO owners(
  full_name,
  age)
VALUES(
    'Bob',
    45);

INSERT INTO owners(
  full_name,
  age)
VALUES(
    'Melody Pond',
    77);

INSERT INTO owners(
  full_name,
  age)
VALUES(
    'Dean Winchester',
    14);

INSERT INTO owners(
  full_name,
  age)
VALUES(
    'Jodie Whittaker',
    38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals
SET species_id = 2  
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon';

UPDATE animals 
SET owner_id = 1 
WHERE name = 'Agumon';

UPDATE animals 
SET owner_id = 2 
WHERE name IN('Gabumon', 'Pikachu');

UPDATE animals 
SET owner_id = 3 
WHERE name IN('Devimon', 'Plantmon');

UPDATE animals 
SET owner_id = 4 
WHERE name IN('Charmander', 'Squirtle', 'Blossom');

UPDATE animals 
SET owner_id = 5 
WHERE name IN('Angemon', 'Boarmon');

    /* Day4 */

INSERT INTO vets(
  name, 
  age, 
  date_of_graduation
  )
  VALUES(
    'William Tatcher', 45, 'Apr 23, 2000');

INSERT INTO vets(
  name, 
  age, 
  date_of_graduation
  )
  VALUES(
    'Maisy Smith', 26, 'Jan 17, 2019');

INSERT INTO vets(
  name, 
  age, 
  date_of_graduation
  )
  VALUES(
    'Stephanie Mendez', 64, 'May 4, 1981');

INSERT INTO vets(
  name, 
  age, 
  date_of_graduation
  )
  VALUES(
    'Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specialization (vets_id, species_id) VALUES (1, 1);
INSERT INTO specialization (vets_id, species_id) VALUES (3, 2);
INSERT INTO specialization (vets_id, species_id) VALUES (3, 1);
INSERT INTO specialization (vets_id, species_id) VALUES (4, 2); 

INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (1, 1, 'May 24, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (1, 3, 'Jul 22, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (2, 4, 'Feb 2, 2021');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (3, 2, 'Jan 5, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (3, 2, 'Mar 8, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (3, 2, 'May 14, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (4, 3, 'May 4, 2021');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (5, 4, 'Feb 24, 2021');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (6, 2, 'Dec 21, 2019');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (6, 1, 'Aug 10, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (6, 2, 'Apr 7, 2021');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (7, 3, 'Sep 29, 2019');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (8, 4, 'Oct 3, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (8, 4, 'Nov 4, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (16, 2, 'Jan 24, 2019');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (16, 2, 'May 15, 2019');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (16, 2, 'Feb 27, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (16, 2, 'Aug 3, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (17, 3, 'May 24, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_vist) VALUES (17, 1, 'Jan 11, 2021');