
## PG backend database transfer

- `docker-compose exec -T <db-service> pg_dumpall -c -U <postgres> | gzip > <db.gz>` Take backup of database
- `cat <db-file.sql> | docker exec -i <db-container> psql -U <postgres>` populate database

## Mysql backend database transfer
- `docker-compose exec -T <db-service> mysqldump --user root --password  <database-name> | gzip > db.gz` Dump single database
- `docker exec -i <db-container> mysql -u<root> -p<password> <database-name> < <db-file.sql>.sql` populate database(No space between -u and user or -p and password)


## Mongodb database import export

- Set all connection-url without password
- `mongoexport --uri <connection-url> --collection <table> --out file.json` Export single table.
- `mongoimport --uri <connection-url> --collection <table> file.json` Import single table.

- `mongodump --uri <connection-url> --out ./<folder>` Export full database.
- `mongorestore --uri <connection-url> ./<folder>` Restore database.
