FROM vandertil/baseimage-java8
MAINTAINER Jos van der Til <jos@vandertil.net>

RUN apt-get update
RUN apt-get install -q -y git wget ; apt-get clean ; apt-get autoclean

# Create user to run teamcity
RUN adduser --disabled-password --system --no-create-home --shell /bin/sh teamcity

ENV TEAMCITY_PACKAGE TeamCity-9.0.4.tar.gz
ENV TEAMCITY_INSTALL_DIR /usr/local

RUN wget -q -O - http://download.jetbrains.com/teamcity/$TEAMCITY_PACKAGE | tar -C $TEAMCITY_INSTALL_DIR -xzf -
RUN sed -i '/<Connector port="8111" protocol="org.apache.coyote.http11.Http11NioProtocol"/a scheme="https"' $TEAMCITY_INSTALL_DIR/TeamCity/conf/server.xml

RUN chown -R teamcity:nogroup $TEAMCITY_INSTALL_DIR/TeamCity

VOLUME /usr/local/teamcity-data

ENV TEAMCITY_DATA_PATH /usr/local/teamcity-data

RUN mkdir -p /etc/service/teamcity
ADD start.sh /etc/service/teamcity/run
RUN chmod +x /etc/service/teamcity/run

EXPOSE 8111

CMD ["/sbin/my_init"]
