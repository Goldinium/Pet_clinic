/*populate table with pokemons*/

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
('Agumon','2020-02-03', 0, true, 10.23),
('Gabumon','2018-11-15', 2, true, 8),
('Pikachu','2021-01-07', 1, false, 15.04),
('Devimon','2017-05-12', 5, true, 11);

/*populate table with details about pokemons*/

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

/*populate table with details about pokemons owners*/

INSERT INTO owners (full_name, age)
VALUES 
('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bod', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

/*populate table with details about pokemons types*/

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

/*
    If the name ends in "mon" it will be Digimon,
    the rest are Pokemon
*/

UPDATE animals 
SET species_id = CASE 
WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon') 
ELSE (SELECT id FROM species WHERE name = 'Pokemon')
END;

/* include owner information*/

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jenniefer Orwell'; 

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob'; 

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Charmander', 'Spuirtle', 'Blossom') AND owners.full_name = 'Melody Pond'; 

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester'; 


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

