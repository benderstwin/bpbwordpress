FROM wordpress:latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip

RUN curl --silent --show-error https://getcomposer.org/installer | php

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
