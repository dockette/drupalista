ARG PHP_EXTENSIONS="\
    amqp \
    apcu \
    ast \
    bcmath \
    blackfire \
    bz2 \
    dba \
    ds \
    enchant \
    ev \
    event \
    gd \
    gettext \
    gmp \
    gnupg \
    igbinary \
    imagick \
    imap \
    intl \
    ldap \
    mailparse \
    memcached \
    mongodb \
    msgpack \
    mysqli \
    pcov \
    pdo_dblib \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    pgsql \
    pspell \
    rdkafka \
    redis \
    soap \
    sqlite3 \
    swoole \
    tidy \
    uploadprogress \
    uuid \
    xdebug \
    yaml \
    "

FROM php:8.3-apache-trixie

COPY --from=ghcr.io/mlocati/php-extension-installer:latest /usr/bin/install-php-extensions /usr/local/bin/
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

ARG PHP_EXTENSIONS
RUN install-php-extensions $PHP_EXTENSIONS \
    && a2enmod rewrite headers \
    && sed -ri 's!/var/www/html!/srv!g' /etc/apache2/sites-available/*.conf /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && printf '<Directory /srv>\n    AllowOverride All\n    Require all granted\n</Directory>\n' > /etc/apache2/conf-available/srv.conf \
    && a2enconf srv \
    && rm -rf /var/lib/apt/lists/* /tmp/*

ENV PHP_INI_MEMORY_LIMIT=4096M

# xdebug and blackfire are installed but disabled by default; enable by
# moving the ini files back, e.g. mv /usr/local/etc/php/disabled/docker-php-ext-xdebug.ini conf.d/
RUN mkdir -p /usr/local/etc/php/disabled \
    && mv /usr/local/etc/php/conf.d/*xdebug.ini /usr/local/etc/php/conf.d/*blackfire.ini /usr/local/etc/php/disabled/ \
    && echo "memory_limit=${PHP_INI_MEMORY_LIMIT}" > /usr/local/etc/php/conf.d/zz-memory.ini

WORKDIR /srv
