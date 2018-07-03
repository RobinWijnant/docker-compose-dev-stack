FROM php:7-apache

# Updates
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y

# # Install useful tools
RUN apt-get -y install nano

# Apache config

    # Mod rewrite (RewriteEngine in vhosts)
    RUN a2enmod rewrite headers

    # Mod macro (for vhosts)
    RUN a2enmod macro

    # Mod Proxy (PhpMyAdmin proxy in vhosts)
    RUN a2enmod proxy
    RUN a2enmod proxy_http

    # Setup vhosts
    COPY ./apache/vhosts.conf /etc/apache2/sites-available/000-default.conf
    RUN mkdir -p /var/www/vhosts/default

    # Enable config
    COPY ./apache/apache2.conf /etc/apache2/conf-available/additional.conf
    RUN a2enconf additional.conf

# PHP config

    # Enable config
    COPY ./php/php.ini /usr/local/etc/php/conf.d/additional.ini

    # Extension Xdebug
    ARG INSTALL_XDEBUG=false
    RUN if [ ${INSTALL_XDEBUG} = true ]; then \
        pecl install xdebug && \
        docker-php-ext-enable xdebug \
    ;fi

    # Extension PDO-MYSQL
    ARG INSTALL_PDO_MYSQL=false
    RUN if [ ${INSTALL_PDO_MYSQL} = true ]; then \
        docker-php-ext-install pdo_mysql \
    ;fi

    # Extension ImageMagick
    ARG INSTALL_IMAGEMAGICK=false
    RUN if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
        apt-get install -y libmagickwand-dev imagemagick && \
        pecl install imagick && \
        docker-php-ext-enable imagick \
    ;fi

# Set default work directory
WORKDIR /var/www