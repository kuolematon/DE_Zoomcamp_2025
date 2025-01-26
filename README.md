# README

**Note:** The solution for the homework assignment can be found in the folder `first_sprint/homework1.md`.

## Instructions for Setting Up the Project

### Step 1: Clone the Repository
Clone the repository to your local machine:
```bash
git clone https://github.com/kuolematon/DE_Zoomcamp_2025.git
cd <repository_folder>
```

### Step 2: Connect Your Repository to Codespaces
1. Fork the repository to your own GitHub account.
2. Open the forked repository in GitHub Codespaces.

### Step 3: Install Required Packages
Ensure the following packages are installed:
- Terraform
- Jupyter Notebook

#### Commands for Installation:
```bash
# Install Terraform
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform

# Install Jupyter Notebook
pip install notebook
```

### Step 4: Create Required Folders
Create the following folders with the necessary permissions:
```bash
mkdir ny_taxi_postgres_data pgadmin_data
chmod a+rwx -R ny_taxi_postgres_data pgadmin_data
```

### Step 5: Download and Extract Data Files
Download the required data files and extract them into the `ny_taxi_postgres_data` folder:
```bash
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv
gunzip -f green_tripdata_2019-10.csv.gz
mv green_tripdata_2019-10.csv taxi_zone_lookup.csv ny_taxi_postgres_data/
```

### Step 6: Create the `.env` File
Create a `.env` file in the project root and populate it with your credentials:
```env
POSTGRES_USER=your_postgres_user
POSTGRES_PASSWORD=your_postgres_password
POSTGRES_DB=your_postgres_db
PGADMIN_DEFAULT_EMAIL=your_email
PGADMIN_DEFAULT_PASSWORD=your_pgadmin_password
```

### Step 7: Start the Docker Compose Services
Use the provided `docker-compose.yml` configuration to set up the environment. Run the following command:
```bash
docker-compose up -d
```

### Step 8: Connect to the PostgreSQL Docker Container
To connect to the PostgreSQL container, use the following command:
```bash
docker exec -it postgres psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}
```

### Step 9: Create Database Tables
Run the following SQL commands inside the PostgreSQL terminal to create the necessary tables:

#### Create `green_tripdata` Table:
```sql
CREATE TABLE IF NOT EXISTS public.green_tripdata
(
    vendorid integer,
    lpep_pickup_datetime timestamp without time zone,
    lpep_dropoff_datetime timestamp without time zone,
    store_and_fwd_flag text COLLATE pg_catalog."default",
    ratecodeid integer,
    pulocationid integer,
    dolocationid integer,
    passenger_count integer,
    trip_distance double precision,
    fare_amount double precision,
    extra double precision,
    mta_tax double precision,
    tip_amount double precision,
    tolls_amount double precision,
    ehail_fee double precision,
    improvement_surcharge double precision,
    total_amount double precision,
    payment_type integer,
    trip_type integer,
    congestion_surcharge double precision
);
```

#### Create `taxi_zone_lookup` Table:
```sql
CREATE TABLE IF NOT EXISTS public.taxi_zone_lookup
(
    "LocationID" integer NOT NULL,
    "Borough" text COLLATE pg_catalog."default",
    "Zone" text COLLATE pg_catalog."default",
    service_zone text COLLATE pg_catalog."default",
    CONSTRAINT taxi_zone_lookup_pkey PRIMARY KEY ("LocationID")
);
```

### Step 10: Load Data into Tables
To load the data into the tables, use the following SQL commands:

#### Load `green_tripdata`:
```sql
COPY public.green_tripdata FROM '/var/lib/postgresql/data/green_tripdata_2019-10.csv' DELIMITER ',' CSV HEADER;
```

#### Load `taxi_zone_lookup`:
```sql
COPY public.taxi_zone_lookup FROM '/var/lib/postgresql/data/taxi_zone_lookup.csv' DELIMITER ',' CSV HEADER;
```

---

Now your environment is ready for use! If you encounter any issues, ensure all steps are completed correctly or refer to the documentation. 😊

