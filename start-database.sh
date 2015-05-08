docker run -t -d \
  --name teamcity-db \
  -e POSTGRES_PASSWORD=$DATABASE_PASSWORD \
  -e POSTGRES_USER=teamcity \
  --volumes-from=teamcity-data \
  postgres
  
