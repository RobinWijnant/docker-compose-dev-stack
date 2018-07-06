FROM php:7

# Install nano & git
RUN apt-get update && \
    apt-get install -yqq \
    gnupg \
    zip \
    unzip \
    git \
    nano

# PHP config

    # Extension Xdebug
    ARG INSTALL_XDEBUG=false
    RUN if [ ${INSTALL_XDEBUG} = true ]; then \
        pecl install -f xdebug && \
        docker-php-ext-enable xdebug \
    ;fi

    # Extension PDO-MYSQL
    ARG INSTALL_PDO_MYSQL=false
    RUN if [ ${INSTALL_PDO_MYSQL} = true ]; then \
        docker-php-ext-install pdo_mysql \
    ;fi

    # Extension MongoDB
    ARG INSTALL_MONGODB=false
    RUN if [ ${INSTALL_MONGODB} = true ]; then \
        pecl install -f mongodb && \
        docker-php-ext-enable mongodb \
    ;fi

    # Extension ImageMagick
    ARG INSTALL_IMAGEMAGICK=false
    RUN if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
        apt-get install -y libmagickwand-dev imagemagick && \
        pecl install -f imagick && \
        docker-php-ext-enable imagick \
    ;fi

# Install composer
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer && \
    . ~/.bashrc

# Install NodeJS & NPM
WORKDIR /root
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh && \
    bash ./nodesource_setup.sh && \
    apt-get update && \
    apt-get install -y \
    nodejs \
    build-essential

# Install Yarn
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y \
    yarn

# Set default work directory
WORKDIR /var/www/html