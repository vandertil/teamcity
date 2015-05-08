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
2. Clone this repository and run build.sh
3. Run run.sh

Known Issues
------------
Exposes passwords through environment variables.
Care should be taken when running agents in the same containers as the server, or using container linking. These methods expose the environment variables through the web interface.
