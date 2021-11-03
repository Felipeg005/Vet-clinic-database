/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN 2016 AND 2019;
SELECT * from animals WHERE neutered IS 'true' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IS 'Agumon' OR 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered IS 'true';
SELECT * from animals WHERE NOT name = 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT * from animals WHERE neutered IS true;
