This is my docker compose for locally hosted projects so that I don't have to rebuild it whenever I break the thing.

## General
Create a `.env` with:
```.env
PG_HOST=postgres
PG_USER=nick
PG_PASS=<secret postgres password>

PGADMIN_EMAIL=<web login username>
PGADMIN_PASS=<web login password>

SECRET_KEY = 'django-insecure-abcdefghijklmnop'

TUNNEL_ID=<tunnel UUID>
TUNNEL_TOKEN=<super secret tunnel>
```

To run:
`docker compose up -d`

## Postgres setup
Postgres is now running, but there is no server or databases, making it hard to connect with a database db manager like PgAdmin or DBeaver if there's no default.

We could login and use psql to set things up with a script. But we also can use web version of PgAdmin GUI to do the initial setup. It is also useful for management in general.

1. Go to http://<ip_or_hostname>:8080 (e.g., http://orange:8080)
2. Login with the credentials set in the .env
3. Register a new server with the hostname `postgres` (must match the service in docker compose), and the username and password from the .env file.
4. Create a database.


## Building postgres

Build clean image from scratch:
`docker compose -f docker-compose.build.yml build --no-cache`

Build and run:
`docker compose -f docker-compose.yml -f docker-compose.build.yml up -d`

## Backup and restore
There is an automated backup script that runs every day at 3am. It will backup the database to the `BACKUP_PATH` in the .env file.

To restore a backup:
`docker exec -i postgres pg_restore -U $PG_USER -d $PG_DB < /path/to/backup-date-time.sql`