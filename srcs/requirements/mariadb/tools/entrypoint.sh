#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    /usr/bin/mysqld_safe --datadir=/var/lib/mysql &
    until mysqladmin ping -h localhost --silent; do
        echo "Waiting for MariaDB to be ready..."
        sleep 1
    done

    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

    echo "MariaDB initialization complete."
else
    echo "MariaDB data directory already initialized."
fi

echo "Starting MariaDB server..."
exec mysqld --user=mysql --console
