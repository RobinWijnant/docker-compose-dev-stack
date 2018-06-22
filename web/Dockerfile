FROM php:apache

# Updates
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y

# Install useful tools
RUN apt-get -y install nano

# PHP Extensions

    # Xdebug
    ARG INSTALL_XDEBUG=false
    RUN if [ ${INSTALL_XDEBUG} = true ]; then \
        pecl install xdebug && \
        docker-php-ext-enable xdebug \
    ;fi

    # PDO-MYSQL
    ARG INSTALL_PDO_MYSQL=false
    RUN if [ ${INSTALL_PDO_MYSQL} = true ]; then \
        docker-php-ext-install pdo_mysql \
    ;fi

    # ImageMagick
    ARG INSTALL_IMAGEMAGICK=false
    RUN if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
        apt-get install -y libmagickwand-dev imagemagick && \
        pecl install imagick && \
        docker-php-ext-enable imagick \
    ;fi

# Apache modules

    # Mod rewrite
    RUN a2enmod rewrite headers