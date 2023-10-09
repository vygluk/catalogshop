# USER root

# ARG USER_ID
# ARG GROUP_ID
# RUN service-user
#
# ENV PHP_DATE_TIMEZONE=Europe/Vilnius
#
# USER nobody

# Use an official PHP-FPM image as the base image
FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip


# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    # Add any system dependencies you need here

    # Install PHP extensions using PECL or from official repositories
    && docker-php-ext-install pdo pdo_mysql # Add more extensions as needed

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
# Set the working directory within the container
WORKDIR /var/www

# Copy your application code into the container
COPY . /var/www

# Expose the port (if necessary)
# EXPOSE 9000

# Define any environment variables (if necessary)
# ENV APP_ENV=production

# You can add more configuration and setup steps here as needed.

# Start PHP-FPM
CMD ["php-fpm"]

# You can also specify any additional startup commands or entry points if needed.