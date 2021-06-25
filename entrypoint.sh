#!/bin/bash

sed -i 's|$AUTH_DB|'"$AUTH_DB"'|g' init.sql
sed -i 's|$CERT_DB|'"$CERT_DB"'|g' init.sql
sed -i 's|$ANSPAR_DB|'"$ANSPAR_DB"'|g' init.sql
sed -i 's|$AUTH_USER|'"$AUTH_USER"'|g' init.sql
sed -i 's|$AUTH_PASS|'"$AUTH_PASS"'|g' init.sql
sed -i 's|$CERT_USER|'"$CERT_USER"'|g' init.sql
sed -i 's|$CERT_PASS|'"$CERT_PASS"'|g' init.sql
sed -i 's|$ANSPAR_USER|'"$ANSPAR_USER"'|g' init.sql
sed -i 's|$ANSPAR_PASS|'"$ANSPAR_PASS"'|g' init.sql

mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ADMIN_USER --password=$DB_ADMIN_PASSWORD < init.sql
