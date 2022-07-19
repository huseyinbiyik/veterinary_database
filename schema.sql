/* Database schema to keep the structure of entire database. */
vet_clinic = # CREATE TABLE animals(
id integer generated by default as identity (start with 1 increment by 1),
name varchar(100) not null,
date_of_birth date not null,
escape_attemps integer not null,
neutered boolean not null,
weight_kg decimal not null
);

ALTER TABLE
    animals
ADD
    species varchar(100);