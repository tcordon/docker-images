# Dockerfile
FROM php:7.2-apache

MAINTAINER tcordon <toni.cordon@gmail.com>

# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
	libpng++-dev \
        libssl-dev \
    && pecl install mongodb \
    && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/ext-mongodb.ini \
    && echo "upload_max_filesize = 5M" > /usr/local/etc/php/conf.d/upload.ini \
    && docker-php-ext-install iconv mbstring exif zip bcmath \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

#Override Apache configuration
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

#WorkDir
WORKDIR /var/www/

#Enable mod_rewrite
RUN a2enmod rewrite
