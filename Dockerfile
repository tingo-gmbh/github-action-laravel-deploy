# Container image that runs your code
FROM php:7.4-apache

# Basic system software
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip unzip libgmp-dev curl libzip-dev libonig-dev openssh-client && \
    pecl channel-update pecl.php.net && \
    docker-php-source delete

# Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install remaining php modules
RUN docker-php-ext-install gmp mbstring pdo zip mysqli pdo_mysql sockets

WORKDIR /var/www/html

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]