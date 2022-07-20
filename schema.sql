/* Database schema to keep the structure of entire database. */
vet_clinic =  CREATE TABLE animals(
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

/*New Tables*/
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- Change primary key
ALTER TABLE
    animals
ADD
    PRIMARY KEY(id);

--  Remove species column
ALTER TABLE
    animals DROP COLUMN species;

-- Add species column and set foreign key
ALTER TABLE
    animals
ADD
    COLUMN species_id INT;

ALTER TABLE
    animals
ADD
    FOREIGN KEY (species_id) REFERENCES species (id);

-- Add owners column and set foreign key
ALTER TABLE
    animals
ADD
    COLUMN owner_id INT;

ALTER TABLE
    animals
ADD
    FOREIGN KEY (owner_id) REFERENCES owners (id);