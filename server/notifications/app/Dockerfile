# Docker image for a Laravel API service that sends notifications to users

# PHP version 8.3

# Laravel version 11

# Use an official PHP 8.3 with laravel slim image as a parent image
FROM php:8.3-fpm-alpine3.19

# Install composer
RUN apk add --no-cache \
    composer

# Copy the app directory contents into the container at /var/www/html
COPY . /var/www/html

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install dependencies using composer
RUN composer install --no-dev --no-interaction --optimize-autoloader

# Create user and group
RUN addgroup -g 1000 www
RUN adduser -u 1000 -G www -s /bin/sh -D www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000

# Make the directory storage writable
CMD ["php-fpm"]

