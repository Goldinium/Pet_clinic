CREATE DATABASE vet_clinic;

/*create a table named 'animals'*/

CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(50),
date_of_birth DATE, escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL(4,2));

/*Add a column species of type string to your animals table*/

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

