FROM vandertil/baseimage-java8
MAINTAINER Jos van der Til <jos@vandertil.net>

RUN apt-get update
RUN apt-get install -q -y git wget ; apt-get clean ; apt-get autoclean

# Create user to run teamcity
RUN adduser --disabled-password --system --no-create-home --shell /bin/sh teamcity

ENV TEAMCITY_PACKAGE TeamCity-9.1.7.tar.gz
ENV TEAMCITY_INSTALL_DIR /usr/local
ENV TEAMCITY_DATA_PATH /usr/local/teamcity-data

RUN wget -q -O - http://download.jetbrains.com/teamcity/$TEAMCITY_PACKAGE | tar -C $TEAMCITY_INSTALL_DIR -xzf -

RUN chown -R teamcity:nogroup $TEAMCITY_INSTALL_DIR/TeamCity

RUN mkdir -p /etc/service/teamcity
ADD teamcity.sh /etc/service/teamcity/run
RUN chmod +x /etc/service/teamcity/run

ADD enable-https.sh $TEAMCITY_INSTALL_DIR/TeamCity/enable-https.sh
RUN chmod +x $TEAMCITY_INSTALL_DIR/TeamCity/enable-https.sh

EXPOSE 8111

CMD ["/sbin/my_init"]
