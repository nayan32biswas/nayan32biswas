# Postgresql

## Setup

1. Install Postgresql

**update** and **Install**.

```bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
```

2. Configration

check **status**

```sql
    service postgresql
```

switch to **postgres user**

```bash
sudo su postgres
```

open postgresql **shell**

```bash
psql
```

```sql
\l -- list of databases
\du -- list of user
CREATE DATABASE db_name;
ALTER USER postgres WITH PASSWORD 'user_password'; -- change password of user
CREATE USER username WITH PASSWORD 'user_password'; -- create new user
ALTER USER username WITH superuser; -- make super user
drop user username; -- remove user
```

**Open specific db** with specific user.

`psql -h localhost -p 5432 -U <username> <database_name>;`

**delete** database. First close all connection or close app if connected with this database.
Open other database or create new one.

```sql
psql -h localhost -p 5432 -U <username> <database_name>;
DROP DATABASE IF EXISTS database_name;
or
drop database <database_name>;
```

Connect credintial **pgadmin**

```sql
name: localhost
Host: 127.0.0.1
Post: 5432
Maintenance DB: postgres
username: nayan32biswas
password: nayan32biswas
```


## Activate

```bash
activate vertualenv:
    source root/bin/activate
python root/lib/python3.6/site-packages/pgadmin4/pgAdmin4.py
```

## Table Query
- \l+ // db_size
- \dt // show all table

## Example

```
docker exec -ti flowwater_db psql -U postgres
\dt

DROP TABLE IF EXISTS home_socialmediasettings;

select * from django_migrations order by id desc;

DELETE FROM django_migrations WHERE id IN (191, 190, 189);
```

## Install pgadmin4

```sh
# Install the public key for the repository (if not done previously):
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'


##### Install pgAdmin #####

# Install for both desktop and web modes:
sudo apt install pgadmin4

# Install for desktop mode only:
sudo apt install pgadmin4-desktop

# Install for web mode only: 
sudo apt install pgadmin4-web 

# Configure the webserver, if you installed pgadmin4-web:
sudo /usr/pgadmin4/bin/setup-web.sh
```
