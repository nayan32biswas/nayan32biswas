
## PG backend database transfer

- `docker-compose exec -T <db-service> pg_dumpall -c -U <postgres> | gzip > <db.gz>` Take backup of database
- `cat <db-file.sql> | docker exec -i <db-container> psql -U <postgres>` populate database

