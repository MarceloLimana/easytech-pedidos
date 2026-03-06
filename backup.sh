#!/bin/bash

DATA=$(date +"%Y-%m-%d_%H-%M")

PASTA="/home/sushi/clientes/sushiinhouse"
BACKUP="$PASTA/backups"

# Backup PostgreSQL
docker exec projeto-garantia-db-garantia-1 pg_dump -U postgres postgres > $BACKUP/db_$DATA.sql

# Commit Git
cd $PASTA

git add .
git commit -m "Backup automático $DATA"

git push origin main
