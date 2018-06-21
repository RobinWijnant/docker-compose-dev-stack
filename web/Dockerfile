FROM php:apache

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y

# Xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# PHP Extensions

    # PDO-MYSQL
    RUN apt-get -y install mysql-client libmagickwand-dev
    RUN docker-php-ext-install pdo_mysql

    # ImageMagick
    ARG INSTALL_IMAGEMAGICK=false
    RUN if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
        apt-get install -y libmagickwand-dev imagemagick && \
        pecl install imagick && \
        docker-php-ext-enable imagick \
    ;fi

# Enable apache modules
RUN a2enmod rewrite headers