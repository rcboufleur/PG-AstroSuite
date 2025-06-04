-- init_schema.sql
CREATE SCHEMA survey;

CREATE TABLE survey.object_catalog (
    id SERIAL PRIMARY KEY,
    ra DOUBLE PRECISION NOT NULL,
    dec DOUBLE PRECISION NOT NULL,
    dn INTEGER NOT NULL,
    sigma_dn FLOAT8 NOT NULL,
    flux FLOAT8 NOT NULL,
    sigma_flux FLOAT8 NOT NULL,
    abMag FLOAT8 NOT NULL CHECK (abMag >= 0),
    sigma_mag FLOAT8 NOT NULL
);
