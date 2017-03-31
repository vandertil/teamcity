FROM vandertil/baseimage-java:latest-java8
MAINTAINER Jos van der Til <jos@vandertil.net>

RUN apt-get update -qq \
 && apt-get install -q -y git wget \
 && apt-get clean \
 && apt-get autoclean \
 && adduser --disabled-password --system --no-create-home --shell /bin/sh teamcity

ENV TEAMCITY_INSTALL_DIR /usr/local
ENV TEAMCITY_DATA_PATH /usr/local/teamcity-data
ENV TEAMCITY_PACKAGE TeamCity-10.0.5.tar.gz

RUN wget -q -O - http://download.jetbrains.com/teamcity/$TEAMCITY_PACKAGE | tar -C $TEAMCITY_INSTALL_DIR -xzf - \
 && chown -R teamcity:nogroup $TEAMCITY_INSTALL_DIR/TeamCity \
 && mkdir -p /etc/service/teamcity

ADD teamcity.sh /etc/service/teamcity/run
ADD enable-https.sh $TEAMCITY_INSTALL_DIR/TeamCity/enable-https.sh

RUN chmod +x $TEAMCITY_INSTALL_DIR/TeamCity/enable-https.sh \
 && chmod +x /etc/service/teamcity/run

EXPOSE 8111

CMD ["/sbin/my_init"]
