Dockerized TeamCity with PostgreSQL and data container
======================================================
Uses PostgreSQL as the database engine and stores all the data (both teamcity artifacts and databases) in a data only container.

The data container already contains a set of default plugins:
- Octopus Deploy
- Azure Cloud Agents
- GitHub integration

For customization of port bindings, database password, and HTTPS edit run.sh

Quick Start
-----------
1. Clone the baseimage repository (https://github.com/vandertil/baseimage-java8) and run build.sh
2. Clone this repository, go into src/, and run build.sh
3. Run start.sh

Known Issues
------------
Exposes passwords through environment variables.
Care should be taken when running agents in the same container as the server, or using container linking. These methods expose the environment variables through the web interface.

PostgreSQL has synchronous commits enabled, which can be disabled to increase the performance of TeamCity. TeamCity will show a warning about this.
Workaround: Edit the postgresql.conf file in /var/lib/postgresql/data in the data container according to the advice in: https://confluence.jetbrains.com/display/TCD9/How+To...#HowTo...-ConfigureNewlyInstalledPostgreSQLServer

Configuration using Nginx as a proxy
------------------------------------
These instructions are for Debian 8 (Jessie), and should be similar for other distros. However the location of configuration files can be different.

1. Edit run.sh and set the port binding to 127.0.0.1:8111
2. Create a new nginx site in /etc/nginx/sites-available/ e.g. teamcity
3. Import the following config:
```
map $http_upgrade $connection_upgrade {
    default upgrade;
    ''   '';
}

server {
  server_name somehost.example.com;
  proxy_read_timeout 1200;

  location / {
    proxy_pass http://localhost:8111/;
    proxy_http_version 1.1;
    proxy_set_header X-Forwarded-For $remote_addr;
    proxy_set_header Host $server_name:$server_port;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
  }
}
```
4. Reload the nginx service: e.g: service nginx reload
5. Start the TeamCity server using run.sh

Your TeamCity instance should now be available at http://somehost.example.com/.
