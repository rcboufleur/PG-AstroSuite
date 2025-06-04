-- q3c_setup.sql
CREATE EXTENSION IF NOT EXISTS q3c;

-- Q3C index
CREATE INDEX IF NOT EXISTS q3c_idx ON survey.object_catalog (q3c_ang2ipix(ra, dec));
