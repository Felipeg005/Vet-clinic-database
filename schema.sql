/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int NOT NULL IDENTITY(1,1),
    PRIMARY KEY (id),
    name char(250),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    species string
);
