FROM wordpress:latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer &&
    composer install --no-interaction

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
