FROM php:fpm

RUN docker-php-ext-install mysqli

RUN apt-get update && apt-get install -y \
    curl \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libgd3 \
    libgd-dev \
    libzip-dev \ 
    && docker-php-ext-install -j$(nproc) pdo pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \ 
    && docker-php-ext-install -j$(nproc) gd
  
RUN pecl install xdebug && docker-php-ext-enable xdebug

