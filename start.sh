#!/bin/sh
export TEAMCITY_PORT_BINDING="127.0.0.1:8111"
export DATABASE_PASSWORD=supersecretpassword
export HTTPS_ENABLED="false"

./create-data-container.sh
./start-database.sh
./start-teamcity.sh
