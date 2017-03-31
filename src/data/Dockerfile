FROM phusion/baseimage:0.9.16
MAINTAINER Jos van der Til <jos@vandertil.net>

ENV TEAMCITY_DATA_PATH /usr/local/teamcity-data

RUN apt-get update ; apt-get install -q -y wget

RUN mkdir -p $TEAMCITY_DATA_PATH/plugins
RUN mkdir -p $TEAMCITY_DATA_PATH/lib/jdbc
RUN mkdir -p $TEAMCITY_DATA_PATH/config

RUN wget https://download.octopusdeploy.com/octopus-teamcity/4.11.0/Octopus.TeamCity.zip -O $TEAMCITY_DATA_PATH/plugins/Octopus.TeamCity.zip

RUN wget http://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc41.jar -O $TEAMCITY_DATA_PATH/lib/jdbc/postgresql-9.4-1201.jdbc41.jar
RUN wget http://teamcity.jetbrains.com/guestAuth/repository/download/bt398/lastest.lastSuccessful/teamcity.github.zip -O $TEAMCITY_DATA_PATH/plugins/teamcity.github.zip

VOLUME /usr/local/teamcity-data
VOLUME /var/lib/postgresql/data

CMD /bin/true
