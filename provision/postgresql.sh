#!/usr/bin/env bash

PG_VERSION=9.3

apt-get -y install "postgresql-$PG_VERSION"
apt-get -y install "postgresql-contrib-$PG_VERSION"
apt-get -y install "postgresql-client-$PG_VERSION"
apt-get -y install "postgresql-server-dev-$PG_VERSION"

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "$PG_HBA"

# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"

# Restart so that all new config is loaded:
service postgresql restart

sudo -u postgres psql -c "CREATE USER vagrant PASSWORD 'vagrant' CREATEDB CREATEROLE SUPERUSER;"
