ARG IMAGE_TAG="cli"
FROM amd64/php:${IMAGE_TAG}
LABEL maintainer="Recht logisch <https://rechtlogisch.de>"

## Set paths
ENV HOME=/var/www
ENV PATH_BIN=/usr/local/bin

## Install FFI, unzip and delete obsolete files
RUN apt-get -yqq update && \
    apt-get install -yqq libffi-dev unzip && \
    docker-php-ext-install -j$(nproc) ffi && \
    docker-php-source delete && \
    rm -r /var/lib/apt/lists/* && rm -rf /tmp/pear && \
    rmdir $HOME/html

## Copy config
COPY config/*.ini /usr/local/etc/php/conf.d/

## Copy scripts
COPY scripts/*.php $PATH_BIN/

## Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

## When set, no output in Pipelines
#USER www-data

## Set working directory
WORKDIR $HOME
