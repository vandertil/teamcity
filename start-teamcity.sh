#!/bin/sh
HTTPS_ENABLED="false"

docker run -t -d -p 8111:8111 \
  --name teamcity \
  --volumes-from=teamcity-data \
  --link teamcity-db:postgres \
  -e POSTGRES_DATABASE=teamcity \
  -e POSTGRES_USER_USERNAME=teamcity \
  -e POSTGRES_USER_PASSWORD=$DATABASE_PASSWORD \
  -e TEAMCITY_ENABLE_HTTPS=$HTTPS_ENABLED \
  vandertil/teamcity
