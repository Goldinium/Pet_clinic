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

CREATE TABLE vets (
id serial PRIMARY KEY, name VARCHAR(50), age integer, date_of_graduation date
);

CREATE TABLE specializations (
id serial PRIMARY KEY, vet_id integer REFERENCES vets(id), species_id integer REFERENCES species(id)
);

CREATE TABLE visits (
id serial PRIMARY KEY, animal_id integer REFERENCES animals(id), vet_id integer REFERENCES vets(id),visit_date date
);