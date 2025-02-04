#!/bin/bash

# Load environment variables
. /etc/environment

# Ensure variables are explicitly exported
export POSTGRES_USER POSTGRES_DB

# Define the backup file path and database name
BACKUP_FILE="/backups/backup_$(date +\%Y\%m\%d-%H\%M\%S).sql"

echo "exporting database to $BACKUP_FILE with command:"
echo "/usr/bin/pg_dump -U $POSTGRES_USER -F c -b -v -f $BACKUP_FILE $POSTGRES_DB"

# Run pg_dump to create the backup
/usr/bin/pg_dump -U $POSTGRES_USER -F c -b -v -f $BACKUP_FILE $POSTGRES_DB
