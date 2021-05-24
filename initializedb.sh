#!/bin/bash

if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

set -o allexport; source .env; set +o allexport;
docker-compose exec -T mysql mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --database=${MYSQL_DATABASE} < vaccinedb.sql