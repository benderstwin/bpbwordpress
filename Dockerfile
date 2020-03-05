FROM wordpress:latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip 
RUN printf "deb http://ftp.no.debian.org/debian/ buster main contrib non-free" > /etc/apt/sources.list && printf "deb-src http://ftp.no.debian.org/debian/ buster main contrib non-free" > /etc/apt/sources.list
RUN apt update && \
    apt install libc-client-dev libkrb5-dev
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo pdo_mysql
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
