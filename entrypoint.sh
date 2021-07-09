#!/bin/bash

export SQL_INIT_FILE="init.sql"
export TMP_INIT_FILE="/tmp/init.sql"
export SQL_DUMMY_FILE="dummydata.sql"
export TMP_DUMMY_FILE="/tmp/dummydata.sql"

cp $SQL_INIT_FILE $TMP_INIT_FILE
cp $SQL_DUMMY_FILE $TMP_DUMMY_FILE

sed -i "s/\$AUTH_DB/$AUTH_DB/" $TMP_INIT_FILE
sed -i "s/\$CERT_DB/$CERT_DB/" $TMP_INIT_FILE
sed -i "s/\$ANSPAR_DB/$ANSPAR_DB/" $TMP_INIT_FILE
sed -i "s/\$AUTH_USER/$AUTH_USER/" $TMP_INIT_FILE
sed -i "s/\$AUTH_PASS/$AUTH_PASS/" $TMP_INIT_FILE
sed -i "s/\$CERT_USER/$CERT_USER/" $TMP_INIT_FILE
sed -i "s/\$CERT_PASS/$CERT_PASS/" $TMP_INIT_FILE
sed -i "s/\$ANSPAR_USER/$ANSPAR_USER/" $TMP_INIT_FILE
sed -i "s/\$ANSPAR_PASS/$ANSPAR_PASS/" $TMP_INIT_FILE


sed -i "s/\$AUTH_DB/$AUTH_DB/" $TMP_DUMMY_FILE
sed -i "s/\$CERT_DB/$CERT_DB/" $TMP_DUMMY_FILE
sed -i "s/\$ANSPAR_DB/$ANSPAR_DB/" $TMP_DUMMY_FILE
sed -i "s/\$AUTH_USER/$AUTH_USER/" $TMP_DUMMY_FILE
sed -i "s/\$AUTH_PASS/$AUTH_PASS/" $TMP_DUMMY_FILE
sed -i "s/\$CERT_USER/$CERT_USER/" $TMP_DUMMY_FILE
sed -i "s/\$CERT_PASS/$CERT_PASS/" $TMP_DUMMY_FILE
sed -i "s/\$ANSPAR_USER/$ANSPAR_USER/" $TMP_DUMMY_FILE
sed -i "s/\$ANSPAR_PASS/$ANSPAR_PASS/" $TMP_DUMMY_FILE

cat $TMP_INIT_FILE > $SQL_INIT_FILE
cat $TMP_DUMMY_FILE > $SQL_DUMMY_FILE

mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ADMIN_USER --password=$DB_ADMIN_PASSWORD --connect-timeout=10 < $SQL_INIT_FILE


if [ "$ADD_DUMMYDATA" = true ] ; then
  mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ADMIN_USER --password=$DB_ADMIN_PASSWORD --connect-timeout=10 < $SQL_DUMMY_FILE
fi
