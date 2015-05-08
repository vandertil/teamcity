#!/bin/sh
export DATABASE_PASSWORD=supersecretpassword
export HTTPS_ENABLED="false"

./create-data-container.sh
./start-database.sh
./start-teamcity.sh
