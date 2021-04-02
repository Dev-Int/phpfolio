ARG PHP_VERSION
ARG PROJECT_NAME
FROM php:${PHP_VERSION}-fpm

RUN rm -rf /var/lib/apt/list*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /${PROJECT_NAME}
