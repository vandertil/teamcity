#!/bin/sh
sed -i '/<Connector port="8111" protocol="org.apache.coyote.http11.Http11NioProtocol"/a scheme="https"' $TEAMCITY_INSTALL_DIR/TeamCity/conf/server.xml
