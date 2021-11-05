/* Populate database with sample data. */
BEGIN;
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0 , true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2 , true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-06-07', 1 , false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0 , true, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2022-11-15', 2 , false, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3 , false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1 , true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7 , true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3 , true, 17);

INSERT INTO species (name) VALUES ('Digimon');
INSERT INTO species (name) VALUES ('Pokemon');

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
COMMIT;

BEGIN;
UPDATE animals SET species_id = (SELECT species.id FROM species WHERE species.name LIKE '%Digimon%') where name like '%mon%';
COMMIT;

BEGIN;
UPDATE animals SET species_id = (SELECT species.id FROM species WHERE species.name LIKE '%Pokemon%') where name NOT like '%mon%';
COMMIT;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
COMMIT;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
COMMIT;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
COMMIT;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
COMMIT;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';
COMMIT;

INSERT INTO vets (full_name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (full_name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-17-2019');
INSERT INTO vets (full_name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (full_name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

BEGIN;
INSERT INTO specializations(vet_id, specie_id) VALUES(
(SELECT vets.id from vets WHERE vets.name = 'William Tatcher'), 
(SELECT species.id from species WHERE species.name = 'Pokemon'));
COMMIT;

BEGIN;
INSERT INTO specializations(vet_id, specie_id) VALUES(
(SELECT vets.id from vets WHERE vets.name = 'Stephanie Mendez'), 
(SELECT id from species WHERE name = 'Digimon'));
COMMIT;

BEGIN;
INSERT INTO specializations(vet_id, specie_id) VALUES(
(SELECT vets.id from vets WHERE vets.name = 'Stephanie Mendez'), 
(SELECT id from species WHERE name = 'Pokemon'));
COMMIT;

BEGIN;
INSERT INTO specializations(vet_id, specie_id) VALUES(
(SELECT id from vets WHERE name = 'Jack Harkness'),
(SELECT id from species WHERE name = 'Digimon'));
COMMIT;

BEGIN;
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES
(
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  '2020-05-24'
),
(
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  '2020-07-22'
),
(
  (SELECT id from animals WHERE name = 'Gabumon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  '2021-02-02'
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2020-01-05'
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2020-03-08'
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2020-05-14'
),
(
  (SELECT id from animals WHERE name = 'Devimon'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  '2021-05-04'
),
(
  (SELECT id from animals WHERE name = 'Charmander'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  '2021-02-24'
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2019-12-21'
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  '2020-08-10'
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2021-04-07'
),
(
  (SELECT id from animals WHERE name = 'Squirtle'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  '2019-09-29'
),
(
  (SELECT id from animals WHERE name = 'Angemon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  '2020-10-03'
),
(
  (SELECT id from animals WHERE name = 'Angemon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  '2020-11-04'
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2019-01-24'
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2019-05-15'
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2020-02-27'
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2020-08-03'
),
(
  (SELECT id from animals WHERE name = 'Blossom'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  '2020-05-24'
),
(
  (SELECT id from animals WHERE name = 'Blossom'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '2021-01-11'
);
COMMIT;