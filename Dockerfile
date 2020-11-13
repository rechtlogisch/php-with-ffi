FROM php:cli
LABEL maintainer="Recht logisch <https://rechtlogisch.de>"

## Set paths
ENV HOME /var/www
ENV PATH_BIN /usr/local/bin

## Install FFI, unzip and delete unneeded files
RUN apt-get update && \
    apt-get install -y libffi-dev unzip && \
    docker-php-ext-install -j$(nproc) ffi && \
    docker-php-source delete && \
    rm -r /var/lib/apt/lists/* && rm -rf /tmp/pear && \
    rmdir $HOME/html

## Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=$PATH_BIN --filename=composer

## Copy scripts
COPY scripts/*.sh $PATH_BIN

## When set, no output in Pipelines
#USER www-data

## Set working directory
WORKDIR $HOME
