#!/bin/sh
docker run -t -d \
  --volumes-from=teamcity-data \
  --name teamcity \
  -p 8111:8111 \
  --link teamcity-db:postgres \
  -e POSTGRES_DATABASE=teamcity \
  -e POSTGRES_USER_USERNAME=teamcity \
  -e POSTGRES_USER_PASSWORD=supersecretpassword \
  vandertil/teamcity
