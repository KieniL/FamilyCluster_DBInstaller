#!/bin/bash

export IMAGENAME=installer
export CONTAINERNAME=installer
export DB_HOST=172.17.0.1
export DB_PORT=3306
export DB_ADMIN_USER=root
export DB_ADMIN_PASSWORD=my-secret-pw
export AUTH_DB=authdb
export AUTH_USER=authuser
export AUTH_PASS=authpw
export ANSPAR_DB=anspardb
export ANSPAR_USER=ansparuser
export ANSPAR_PASS=ansparpass
export CERT_DB=certdb
export CERT_USER=certuser
export CERT_PASS=certpass

docker build -t $IMAGENAME .

docker run -d  \
--env DB_HOST=$DB_HOST \
--env DB_PORT=$DB_PORT \
--env DB_ADMIN_USER=$DB_ADMIN_USER \
--env DB_ADMIN_PASSWORD=$DB_ADMIN_PASSWORD \
--env AUTH_DB=$AUTH_DB \
--env AUTH_USER=$AUTH_USER \
--env AUTH_PASS=$AUTH_PASS \
--env ANSPAR_DB=$ANSPAR_DB \
--env ANSPAR_USER=$ANSPAR_USER \
--env ANSPAR_PASS=$ANSPAR_PASS \
--env CERT_DB=$CERT_DB \
--env CERT_USER=$CERT_USER \
--env CERT_PASS=$CERT_PASS \
--name $CONTAINERNAME $IMAGENAME

docker logs -f $CONTAINERNAME


docker stop $CONTAINERNAME && docker rm $CONTAINERNAME