/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS specializations;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS vets;
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
    CONSTRAint kf_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE,
    CONSTRAint kf_owners FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE
);

CREATE TABLE vets (
    id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
    PRIMARY KEY (id),
    full_name char(250),
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
    id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
    PRIMARY KEY(id),
    specie_id int NOT NULL,
    vet_id int NOT NULL,
    CONSTRAINT fk_species
    FOREIGN KEY(specie_id)
    REFERENCES species(id)
    ON DELETE CASCADE,
    CONSTRAINT fk_vets
    FOREIGN KEY(vet_id)
    REFERENCES vets(id)
    ON DELETE CASCADE    
);

CREATE TABLE visits (
    id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
    vet_id int,
    animal_id int,
    date_of_visit date NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_vet
    FOREIGN KEY (vet_id)
    REFERENCES vets(id)
    ON DELETE CASCADE,
    CONSTRAINT fk_animal
    FOREIGN KEY (animal_id)
    REFERENCES animals(id)
    ON DELETE CASCADE
);
