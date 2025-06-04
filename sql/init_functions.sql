CREATE OR REPLACE FUNCTION normal_random()
RETURNS double precision AS $$
BEGIN
  RETURN sqrt(-2 * LN(RANDOM())) * COS(2 * PI() * RANDOM());
END;
$$ LANGUAGE plpgsql;
