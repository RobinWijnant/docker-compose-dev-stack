FROM php:7

# Install nano & git
RUN apt-get update && \
    apt-get install -yqq \
    gnupg \
    zip \
    unzip \
    git \
    nano

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
WORKDIR /var/www