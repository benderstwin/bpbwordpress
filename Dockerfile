FROM wordpress:latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip php7.2-imap

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo pdo_mysql
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
