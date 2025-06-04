# PG-AstroSuite

PG-AstroSuite is a specialized PostgreSQL-based Docker setup tailored for astronomical data management and analysis. It comes equipped with `q3c` and `pg_sphere` extensions, along with Healpix support for advanced spatial querying capabilities. The suite simplifies complex astronomical data operations and enhances spatial indexing, making it an ideal choice for astronomers and researchers handling celestial data.

## Features

- **PostgreSQL 15**: Built on the robust and widely-used PostgreSQL database system.
- **Q3C**: Extension for efficient spatial querying, optimized for large-scale astronomical catalogs.
- **PGSphere with Healpix**: Supports spherical data types and functions, enhanced with Healpix for greater precision in astronomical computations.
- **Dockerized Environment**: Easy to deploy and manage within Docker containers.

## Getting Started

### Prerequisites

- **Docker** and **Docker Compose**: Ensure you have Docker and Docker Compose installed on your machine.

### Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/rcboufleur/PG-AstroSuite.git
    cd PG-AstroSuite
    ```

2. **Build and Start the Docker Services**:
    ```bash
    docker-compose up --build
    ```

3. **Ingest Random Data and Create Indexes**:
    Run the setup script to create the necessary schema, tables, functions, and ingest random data:
    ```bash
    ./setup_random.sh
    ```

### Usage

- Access your PostgreSQL database through standard PostgreSQL client tools or any client application capable of connecting to PostgreSQL.
- The database is set up with a sample schema and data suitable for demonstrating the use of Q3C and PGSphere for astronomical purposes.

### Connecting to the Database

You can connect to the PG-AstroSuite database using the PostgreSQL command-line interface by following these steps:

- Open your terminal.
- Run the following command to start a PostgreSQL shell:
  ```bash
  psql -h localhost -p 5432 -U postgres -d surveydb

### Key SQL Files

- **create_db.sql**: Initializes the primary database for handling survey data.
- **init_schema.sql**: Sets up the necessary database schema and tables.
- **init_functions.sql**: Initializes custom functions for data operations.
- **generate_data.sql**: Populates the database with random but representative data for testing.
- **q3c_setup.sql**: Sets up `q3c` extension elements within the database.
- **pg_sphere_setup.sql**: Configures `pg_sphere` extension with Healpix support.

## Contributing

Contributions are welcome! Please feel free to submit pull requests, report issues, or suggest enhancements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgments

- [q3c](https://github.com/segasai/q3c)
- [pg_sphere](https://github.com/postgrespro/pgsphere)

---

For detailed guidelines and further documentation, please refer to the `/docs` directory within the repository.
