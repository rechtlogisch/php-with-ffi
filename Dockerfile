ARG IMAGE_TAG="cli"

FROM amd64/php:${IMAGE_TAG} AS build

## Install FFI, keep runtime libraries, remove build-only files
RUN set -eux; \
    set -o pipefail; \
    apt-get update; \
    apt-get install -y --no-install-recommends libffi-dev unzip; \
    docker-php-ext-install -j"$(nproc)" ffi; \
    find /usr/local/bin/php /usr/local/lib/php/extensions -type f \( -name php -o -name '*.so' \) -exec ldd {} + \
        | awk '/=>/ { so = $(NF-1); if (index(so, "/usr/local/") == 1) next; gsub("^/(usr/)?", "", so); print "*" so }' \
        | sort -u \
        | xargs -r dpkg-query --search \
        | awk 'sub(":$", "", $1) { print $1 }' \
        | sort -u \
        | xargs -r apt-mark manual; \
    apt-mark manual ca-certificates curl make unzip xz-utils; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
        $(printf '%s\n' $PHPIZE_DEPS | grep -Evx 'make|libc-dev') libc6-dev libffi-dev; \
    rm -rf /var/lib/apt/lists/* /tmp/pear /usr/src/* \
        /usr/local/include/php /usr/local/lib/libphp.so /usr/local/php \
        /usr/local/lib/php/build /usr/local/lib/php/doc /usr/local/lib/php/test \
        /usr/local/bin/php-cgi /usr/local/bin/phpdbg /usr/local/bin/phpize /usr/local/bin/php-config \
        /usr/local/bin/pecl /usr/local/bin/pear /usr/local/bin/peardev \
        /usr/local/bin/docker-php-ext-* /usr/local/bin/docker-php-source; \
    rmdir /var/www/html

## Copy config
COPY config/*.ini /usr/local/etc/php/conf.d/

## Copy scripts
COPY scripts/*.php /usr/local/bin/

## Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

## Smoke test
RUN set -eux; \
    if ldd /usr/local/bin/php /usr/local/lib/php/extensions/*/*.so | grep 'not found'; then exit 1; fi; \
    php -r 'exit(FFI::cdef("int abs(int);", "libc.so.6")->abs(-42) === 42 ? 0 : 1);'; \
    composer --version; \
    for tool in curl make unzip xz; do command -v "$tool"; done; \
    for tool in gcc phpize pecl docker-php-ext-install; do \
        if command -v "$tool"; then echo "$tool must not be in the image" >&2; exit 1; fi; \
    done

## Single layer without the build-only files
FROM scratch
COPY --from=build / /
LABEL maintainer="Recht logisch <https://rechtlogisch.de>"

## Restore the environment, FROM scratch drops it
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PHP_INI_DIR=/usr/local/etc/php

## Set paths
ENV HOME=/var/www
ENV PATH_BIN=/usr/local/bin

## When set, no output in Pipelines
#USER www-data

## Set working directory
WORKDIR $HOME

ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php", "-a"]
