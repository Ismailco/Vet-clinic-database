/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg REAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR;

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(255),
  age INT,
  PRIMARY KEY(id)
  );

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    PRIMARY KEY(id)
    );

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT, 
ADD FOREIGN KEY (species_id)
REFERENCES species(id)
ON DELETE CASCADE;


ALTER TABLE animals 
ADD COLUMN owner_id INT, 
ADD FOREIGN KEY (owner_id) 
REFERENCES owners (id) 
ON DELETE CASCADE;

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY, 
  name VARCHAR(255), 
  age INT, 
  date_of_graduation DATE,
  PRIMARY KEY(id)
  );

CREATE TABLE specialization(
  vets_id INT, 
  species_id INT);

ALTER TABLE specialization
ADD FOREIGN KEY (vets_id) 
REFERENCES vets (id) 
ON DELETE CASCADE;

ALTER TABLE specialization 
ADD FOREIGN KEY (species_id) 
REFERENCES species (id) 
ON DELETE CASCADE;

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT, 
  vet_id INT, 
  date_of_vist DATE
  );

ALTER TABLE visits 
ADD FOREIGN KEY (animal_id) 
REFERENCES animals (id) 
ON DELETE CASCADE;

ALTER TABLE visits 
ADD FOREIGN KEY (vet_id) 
REFERENCES vets (id) 
ON DELETE CASCADE;