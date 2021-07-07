#!/bin/bash

export SQL_FILE="init.sql"
export TMP_FILE="/tmp/init.sql"

cp $SQL_FILE $TMP_FILE

sed -i "s/\$AUTH_DB/$AUTH_DB/" $TMP_FILE
sed -i "s/\$CERT_DB/$CERT_DB/" $TMP_FILE
sed -i "s/\$ANSPAR_DB/$ANSPAR_DB/" $TMP_FILE
sed -i "s/\$AUTH_USER/$AUTH_USER/" $TMP_FILE
sed -i "s/\$AUTH_PASS/$AUTH_PASS/" $TMP_FILE
sed -i "s/\$CERT_USER/$CERT_USER/" $TMP_FILE
sed -i "s/\$CERT_PASS/$CERT_PASS/" $TMP_FILE
sed -i "s/\$ANSPAR_USER/$ANSPAR_USER/" $TMP_FILE
sed -i "s/\$ANSPAR_PASS/$ANSPAR_PASS/" $TMP_FILE

cat $TMP_FILE > $SQL_FILE

mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ADMIN_USER --password=$DB_ADMIN_PASSWORD --wait-timeout=10 < init.sql
