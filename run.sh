#!/bin/sh
export DATABASE_PASSWORD=supersecretpassword

./create-data-container.sh
./start-database.sh
./start-teamcity.sh
