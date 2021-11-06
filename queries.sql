/nameQueries that provide answers to the questions from all projects.name/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = 'true';
SELECT name FROM animals WHERE NOT name = 'Gabumon';
SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE NOT species = 'digimon' OR species = NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT deleted_animals1;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO SAVEPOINT deleted_animals1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(animals.name) FROM species JOIN animals ON species.id = animals.species_id GROUP BY species.name;
SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell';
SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0; 
SELECT owners.full_name, COUNT(animals.name) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name;

-- Add "join table" for visits queries

SELECT vets.name, animals.name, visits.date_of_visit FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit;

SELECT animals.name, vets.name FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets 
ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY animals.name, vets.name;

SELECT vets.name, species.name FROM vets
FULL JOIN specializations
ON vets.id = specializations.vet_id
FULL JOIN species
ON specializations.specie_id = species.id;

SELECT animals.name, vets.name, visits.date_of_visit FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets 
ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'; 

SELECT animals.name, COUNT(visits.date_of_visit) FROM animals
JOIN visits
ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY visits.date_of_visit;

SELECT vets.name , animals.name,
visits.date_of_visit FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit;

SELECT vets.id, vets.name, vets.age, vets.date_of_graduation, 
  visits.date_of_visit, animals.id, animals.name, animals.date_of_birth,
  animals.escape_attempts, animals.neutered, animals.weigth_kg
  FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
ORDER BY visits.date_of_visit;

SELECT COUNT(visits.date_of_visit) FROM animals
LEFT JOIN visits
ON animals.id = visits.animal_id
JOIN vets 
ON visits.vet_id = vets.id
FULL JOIN specializations 
ON vets.id = specializations.vet_id
FULL JOIN species 
ON specializations.specie_id = species.id
WHERE NOT specializations.specie_id = animals.species_id AND vets.name = 'Stephanie Mendez' OR vets.name = 'Maisy Smith';

SELECT count(species.name), species.name, vets.name FROM animals
JOIN species ON (species.id = animals.species_id)
JOIN owners ON (animals.owner_id = owners.id)
JOIN visits ON (visits.animal_id = animals.id)
JOIN vets ON (vets.id = visits.vet_id)
left join specializations ON (specializations.vet_id = vets.id)
WHERE specializations.vet_id IS NULL
GROUP BY species.name, vets.name;