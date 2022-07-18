/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals where name like '%mon';
SELECT * from animals where date_of_birth between '2016-01-01' and '2019-01-01';
SELECT * from animals where neutered = TRUE and escape_attemps < 3; 
SELECT date_of_birth from animals where name in ('Agumon', 'Pikachu');
SELECT name, escape_attemps from animals where weight_kg > 10.5;
SELECT * from animals where neutered = true;
SELECT * from animals where name NOT in ('Gabumon');
SELECT * from animals WHERE weight_kg >=10.4 and weight_kg <=17.3;
