# https://github.com/docker-library/wordpress/blob/master/apache/Dockerfile
FROM wordpress:latest

# Install the Debian packages we need to build/install other software.
# We link /usr/local/bin/node to /usr/bin/nodejs to ensure it's available
# at that name for Node scripts with `#!/usr/bin/env node` shebangs.
RUN apt-get update && apt-get install -y \
    git \
    node \
    npm \
    unzip \
    wget \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/nodejs /usr/local/bin/node

# Build and install wp-web-push.
COPY wp-web-push /var/tmp/wp-web-push
RUN cd /var/tmp/wp-web-push/ \
    && make tools/composer.phar \
    && tools/composer.phar update \
    && make build \
    && unzip wp-web-push.zip -d /usr/src/wordpress/wp-content/plugins/wp-web-push \
    && rm -rf /var/tmp/wp-web-push

# Install the PHP "composer" utility, which we need to build offline-shell.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Build and install offline-shell.
COPY offline-shell/wp-offline-shell /usr/src/wordpress/wp-content/plugins/wp-offline-shell
RUN cd /usr/src/wordpress/wp-content/plugins/wp-offline-shell/ \
    && composer install

# Install the WP Force SSL plugin so you can force users to the encrypted
# variant of your WordPress website.  This installs the plugin, but it doesn't
# activate it by default, so you can use this Docker image locally without SSL
# during development and then activate the plugin in production.
RUN curl -LO https://downloads.wordpress.org/plugin/wp-force-ssl.zip \
    && unzip wp-force-ssl.zip \
    && rm wp-force-ssl.zip \
    && chown -R www-data:www-data wp-force-ssl \
    && mv wp-force-ssl /usr/src/wordpress/wp-content/plugins/
