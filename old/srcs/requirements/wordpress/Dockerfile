FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd \
    php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml php7.4-zip \
    wget mariadb-client curl unzip && \
    # Create PHP-FPM run directory
    mkdir -p /run/php && \
    # Configure PHP-FPM to listen on port 9000
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
    mkdir -p /var/www/html && \
    wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    # Download and install Astra theme
    mkdir -p /var/www/html/wp-content/themes/ && \
    wget -O /tmp/astra.zip https://downloads.wordpress.org/theme/astra.4.6.7.zip && \
    unzip /tmp/astra.zip -d /var/www/html/wp-content/themes/ && \
    # Set Astra as the default theme
    mkdir -p /var/www/html/wp-content/themes/astra && \
    # Clean up
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/wordpress.tar.gz /tmp/astra.zip

COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm7.4", "-F"]
