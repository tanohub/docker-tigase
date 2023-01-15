#!/bin/bash

echo -e "\n\nusage: db-create-mysql.sh tigase_username tigase_password database_name root_username root_password database_host \n\n"

export USER_NAME=tigase_user
export USER_PASS=tigase_user_passwd
export ROOT_NAME=root
export ROOT_PASS=Password123
export DB_HOST=xmpp-db
export DB_NAME=tigasedb
export DB_TYPE=mysql
export DB_VERSION=7-1

cd /opt/tigase/tigase-server/

# DB schema
java -cp "jars/*" tigase.util.DBSchemaLoader -dbHostname ${DB_HOST} -dbType ${DB_TYPE} -schemaVersion ${VERSION} -dbName ${DB_NAME} -rootUser ${ROOT_NAME} -rootPass ${ROOT_PASS} -dbUser ${USER_NAME} -dbPass ${USER_PASS} -logLevel ALL -file database/${DB_TYPE}-schema-7-1.sql
# pubsub schema
java -cp "jars/*" tigase.util.DBSchemaLoader -dbHostname ${DB_HOST} -dbType ${DB_TYPE} -schemaVersion ${VERSION} -dbName ${DB_NAME} -rootUser ${ROOT_NAME} -rootPass ${ROOT_PASS} -dbUser ${USER_NAME} -dbPass ${USER_PASS} -logLevel ALL -file database/${DB_TYPE}-pubsub-schema-3.2.0.sql
#sock5 schema
java -cp "jars/*" tigase.util.DBSchemaLoader -dbHostname ${DB_HOST} -dbType ${DB_TYPE} -schemaVersion ${VERSION} -dbName ${DB_NAME} -rootUser ${ROOT_NAME} -rootPass ${ROOT_PASS} -dbUser ${USER_NAME} -dbPass ${USER_PASS} -logLevel ALL -file database/${DB_TYPE}-socks5-schema.sql

echo -e "\n\n\nconfiguration:\n\n--user-db=mysql\n--user-db-uri=jdbc:mysql://$DB_HOST:3306/$DB_NAME?user=${USER_NAME}&password=${USER_PASS}&useUnicode=true&characterEncoding=UTF-8&autoCreateUser=true\n\n"

