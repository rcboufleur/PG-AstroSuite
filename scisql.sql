-- file: functions/astro_util.sql

CREATE OR REPLACE FUNCTION ang_sep_pgsphere(ra1 DOUBLE PRECISION, dec1 DOUBLE PRECISION,
                                            ra2 DOUBLE PRECISION, dec2 DOUBLE PRECISION)
RETURNS DOUBLE PRECISION AS $$
BEGIN
    RETURN spoint(radians(ra1), radians(dec1)) <-> spoint(radians(ra2), radians(dec2));
END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;


CREATE OR REPLACE FUNCTION ang_sep_q3c(ra1 DOUBLE PRECISION, dec1 DOUBLE PRECISION,
                                       ra2 DOUBLE PRECISION, dec2 DOUBLE PRECISION)
RETURNS DOUBLE PRECISION AS $$
BEGIN
    RETURN q3c_dist(ra1, dec1, ra2, dec2);
END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;
