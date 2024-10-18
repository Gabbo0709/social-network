FROM php:8.3-fpm-alpine3.19

# Install system dependencies and PHP extensions
RUN apk add --no-cache \
    composer \
    zip \
    libzip-dev \
    freetype \
    libjpeg-turbo \
    libpng \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) zip pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd

# Install Composer
COPY --from=composer:2.7.6 /usr/bin/composer /usr/bin/composer

# Copy the application content to the container at /var/www/html
COPY . /var/www/html

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install dependencies using Composer
RUN composer install --no-dev --no-interaction --optimize-autoloader

# Create user and group
RUN addgroup -g 1000 www
RUN adduser -u 1000 -G www -s /bin/sh -D www
USER www

# Expose port 9000 and start the php-fpm server
EXPOSE 9000

# Make the storage directory writable
CMD ["php-fpm"]