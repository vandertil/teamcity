FROM phusion/baseimage:0.9.16
MAINTAINER Jos van der Til <jos@vandertil.net>

ENV TEAMCITY_DATA_PATH /usr/local/teamcity-data

RUN apt-get update ; apt-get install -q -y wget

RUN mkdir -p $TEAMCITY_DATA_PATH/plugins
RUN mkdir -p $TEAMCITY_DATA_PATH/lib/jdbc
RUN mkdir -p $TEAMCITY_DATA_PATH/config

RUN wget https://download.octopusdeploy.com/octopus-teamcity/4.11.0/Octopus.TeamCity.zip -O $TEAMCITY_DATA_PATH/plugins/Octopus.TeamCity.zip

RUN wget https://jdbc.postgresql.org/download/postgresql-42.0.0.jar -O $TEAMCITY_DATA_PATH/lib/jdbc/postgresql-42.0.0.jar
RUN wget https://teamcity.jetbrains.com/guestAuth/repository/download/bt398/lastest.lastSuccessful/teamcity.github.zip -O $TEAMCITY_DATA_PATH/plugins/teamcity.github.zip
RUN wget "https://plugins.jetbrains.com/plugin/download?pr=teamcity&updateId=29587" -O $TEAMCITY_DATA_PATH/plugins/dotnet-core-plugin.zip

VOLUME /usr/local/teamcity-data
VOLUME /var/lib/postgresql/data

CMD /bin/true
