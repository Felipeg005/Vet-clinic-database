/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
    PRIMARY KEY (id),
    name char(250),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    species char(250)
);
