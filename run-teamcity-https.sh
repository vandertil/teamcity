#!/bin/sh
docker run -t -d --name teamcity -p 8111:8111 vandertil/teamcity /bin/sh "-c" "/usr/local/TeamCity/enable-https.sh && /sbin/my_init"
