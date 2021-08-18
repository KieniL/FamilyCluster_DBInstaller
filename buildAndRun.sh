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
export ADD_DUMMYDATA=true

mkdir config

echo $AUTH_DB > config/AUTH_DB
echo $CERT_DB> config/CERT_DB
echo $ANSPAR_DB > config/ANSPAR_DB
echo $AUTH_USER > config/AUTH_USER
echo $AUTH_PASS > config/AUTH_PASS
echo $CERT_USER > config/CERT_USER
echo $CERT_PASS > config/CERT_PASS
echo $ANSPAR_USER > config/ANSPAR_USER
echo $ANSPAR_PASS > config/ANSPAR_PASS
echo $DB_HOST > config/DB_HOST
echo $DB_PORT > config/DB_PORT
echo $DB_ADMIN_USER > config/DB_ADMIN_USER
echo $DB_ADMIN_PASSWORD > config/DB_ADMIN_PASSWORD

docker build -t $IMAGENAME .


docker run -d  \
--env ADD_DUMMYDATA=$ADD_DUMMYDATA \
-v /home/lukas/Desktop/FamilyClusterGroup/FamilyCluster_DBInstaller/config:/etc/config \
--name $CONTAINERNAME $IMAGENAME

docker logs -f $CONTAINERNAME


docker stop $CONTAINERNAME && docker rm $CONTAINERNAME && rm -r ./config