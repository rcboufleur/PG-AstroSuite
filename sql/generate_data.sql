INSERT INTO survey.object_catalog (
    ra,
    dec,
    dn,
    sigma_dn,
    flux,
    sigma_flux,
    abMag,
    sigma_mag
)
SELECT
    (RANDOM() * 360) AS ra,
    (2 * RANDOM() - 1) * 90 AS dec,
    ROUND(1 + 10 * RANDOM())::int AS dn_val,
    (ROUND(1 + 10 * RANDOM())::int) * (1e-2 + RANDOM() / 10) AS sigma_dn,
    EXP(5 + 3 * LOG(RANDOM() + 1)) AS flux_val,
    EXP(5 + 3 * LOG(RANDOM() + 1)) * (1 / POWER(ROUND(1 + 10 * RANDOM())::int, 0.3)) * (1e-4 + RANDOM() / 100) AS sigma_flux,
    ABS(ROUND(ABS(NORMAL_RANDOM()))) AS abMag,
    0.1 * (1 + ABS(ROUND(ABS(NORMAL_RANDOM()))) / 10) AS sigma_mag
FROM generate_series(1, 100000);
