This is my docker compose for locally hosted projects so that I don't have to rebuild it whenever I break the thing.

## General
Create a `.env` with:
```.env
PG_USER=nick
PG_PASS=<secret postgres password>
PGADMIN_EMAIL=<web login username>
PGADMIN_PASS=<web login password>
```

To run:
`docker compose up -d`

## Postgres setup
Postgres is now running, but there is no server or databases, making it hard to connect with a database db manager like PgAdmin or DBeaver if there's no default.

We could login and use psql to set things up with a script. But we also can use web version of PgAdmin GUI to do the initial setup. It is also useful for management in general.

1. Go to http://<local_id_address>:8080
2. Login with the credentials set in the .env
3. Register a new server with the hostname `postgres` (must match the service in docker compose), and the username and password from the .env file.
4. Create a database.
