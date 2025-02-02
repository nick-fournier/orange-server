#!/bin/bash

# Define the backup file path and database name
BACKUP_FILE="/backups/backup_$(date +\%Y\%m\%d\%H\%M\%S).dump"

# Run pg_dump to create the backup
/usr/bin/pg_dump -U $PG_USER -F c -b -v -f $BACKUP_FILE $PG_DBNAME
