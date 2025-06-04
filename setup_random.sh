#/bin/bash
# Genearte databese
docker compose exec db-postgres psql -h localhost -U postgres -f sql/create_db.sql
# Init schema and tables
docker compose exec db-postgres psql -h localhost -U postgres -d surveydb -a -f sql/init_schema.sql
# Init functions
docker compose exec db-postgres psql -h localhost -U postgres -d surveydb -a -f sql/init_functions.sql
# Generate data
docker compose exec db-postgres psql -h localhost -U postgres -d surveydb -a -f sql/generate_data.sql
# Setup Q3C
docker-compose exec db-postgres psql -U postgres -d surveydb -a -f sql/q3c_setup.sql
# Setup PGSphere
docker-compose exec db-postgres psql -U postgres -d surveydb -a -f sql/pg_sphere_setup.sql
