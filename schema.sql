/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;

CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
    PRIMARY KEY (id),
    name char(250)
);

CREATE TABLE owners (
    id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
    PRIMARY KEY (id),
    full_name char(250),
    age int
);

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
    PRIMARY KEY (id),
    name char(250),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    species_id int,
    owner_id int,
    FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE,
    FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE
);
