#!/bin/bash
echo "connectionUrl=jdbc\:postgresql\://$POSTGRES_PORT_5432_TCP_ADDR\:$POSTGRES_PORT_5432_TCP_PORT/$POSTGRES_DATABASE" > $TEAMCITY_DATA_PATH/config/database.properties
echo "connectionProperties.user=$POSTGRES_USER_USERNAME" >> $TEAMCITY_DATA_PATH/config/database.properties
echo "connectionProperties.password=$POSTGRES_USER_PASSWORD" >> $TEAMCITY_DATA_PATH/config/database.properties
echo "maxConnections=50" >> $TEAMCITY_DATA_PATH/config/database.properties

chown -R teamcity:nogroup $TEAMCITY_DATA_PATH

su -c "$TEAMCITY_INSTALL_DIR/TeamCity/bin/teamcity-server.sh run" teamcity

