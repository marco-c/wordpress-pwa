# https://github.com/docker-library/wordpress/blob/master/apache/Dockerfile
FROM wordpress:latest

COPY wp-web-push/wp-web-push /usr/src/wordpress/wp-content/plugins/wp-web-push

RUN apt-get update && apt-get install -y \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install the WP Force SSL plugin so you can force users to the encrypted
# variant of your WordPress website.  This installs the plugin, but it doesn't
# activate it by default, so you can use this Docker image locally without SSL
# during development and then activate the plugin in production.
RUN curl -LO https://downloads.wordpress.org/plugin/wp-force-ssl.zip \
    && unzip wp-force-ssl.zip \
    && rm wp-force-ssl.zip \
    && chown -R www-data:www-data wp-force-ssl \
    && mv wp-force-ssl /usr/src/wordpress/wp-content/plugins/
