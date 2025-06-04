-- Enable pg_sphere extension
CREATE EXTENSION IF NOT EXISTS pg_sphere;

-- Add 'sp' column with correct schema
ALTER TABLE survey.object_catalog ADD COLUMN IF NOT EXISTS sp spoint;

-- Populate 'sp' with spherical points (ensure double precision)
UPDATE survey.object_catalog
SET sp = spoint(radians(ra::double precision), radians(dec::double precision))
WHERE sp IS NULL;

-- Create GiST index on 'sp'
CREATE INDEX IF NOT EXISTS sp_idx ON survey.object_catalog USING gist (sp);
