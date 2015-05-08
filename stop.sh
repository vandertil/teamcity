#!/bin/sh
docker stop teamcity
docker stop teamcity-db
docker rm teamcity
docker rm teamcity-db
