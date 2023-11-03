CREATE DATABASE vet_clinic;

/*create a table named 'animals'*/

CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(50),
date_of_birth DATE, escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL(4,2));

/*Add a column species of type string to your animals table*/

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

/*Add a table for owners*/

CREATE TABLE owners (id SERIAL PRIMARY KEY, full_name VARCHAR(50), age INTEGER);

/*Add a table for pokemons species*/

CREATE TABLE species (id SERIAL PRIMARY KEY, name VARCHAR(50));

/*animals table ID is already an autoincremented PRIMARY KEY*/

/*remove species colomun*/

ALTER TABLE animals DROP COLUMN species;

/*Add column species_id which is a foreign key referencing species table*/

ALTER TABLE animals ADD COLUMN species_id integer REFERENCES species(id);

/*Add column owner_id which is a foreign key referencing the owners table*/

ALTER TABLE animals ADD COLUMN owner_id integer REFERENCES owners(id);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visit_animal_id ON visits(animal_id ASC); 

CREATE INDEX visit_vet_id ON visits(vet_id);

CREATE INDEX owners_email ON owners (email);