#!/bin/bash
echo "Waiting for database connection..."
while ! mysqladmin ping -h "mariadb" -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --silent; do
    echo "Waiting for MariaDB connection..."
    sleep 3
done
echo "Connected to MariaDB!"

mkdir -p /run/php
chown -R www-data:www-data /var/www/html
if [ ! -f /var/www/html/.wordpress_setup_done ]; then
    echo "Setting up WordPress theme..."
    # Run the setup script as the www-data user
    su -s /bin/bash -c "php /var/www/html/setup-theme.php" www-data
    # Create a flag file to indicate setup is done
    touch /var/www/html/.wordpress_setup_done
    echo "WordPress theme setup completed."
fi

exec "$@"