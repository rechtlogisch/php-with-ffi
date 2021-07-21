# PHP with FFI

[![GitHub Workflow actions](https://github.com/rechtlogisch/php-with-ffi/workflows/Publish%20images/badge.svg)](https://github.com/rechtlogisch/php-with-ffi/actions)
[![Docker Cloud automated build](https://img.shields.io/docker/cloud/automated/rechtlogisch/php-with-ffi)](https://hub.docker.com/r/rechtlogisch/php-with-ffi)
[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/rechtlogisch/php-with-ffi)](https://hub.docker.com/r/rechtlogisch/php-with-ffi/builds)
[![Docker image size :latest](https://img.shields.io/docker/image-size/rechtlogisch/php-with-ffi/latest)](https://hub.docker.com/r/rechtlogisch/php-with-ffi/tags)
[![Docker pulls :latest](https://img.shields.io/docker/pulls/rechtlogisch/php-with-ffi)](https://hub.docker.com/r/rechtlogisch/php-with-ffi)

A custom image for CI Pipelines including the PHP FFI extension and Composer.

Based on the currently supported PHP version (base image defaults to: [cli](https://github.com/docker-library/docs/blob/master/php/README.md#supported-tags-and-respective-dockerfile-links)).

Features:
- PHP 8.1 RC / PHP 8 / PHP 7.4 (based on [tags](https://hub.docker.com/repository/docker/rechtlogisch/php-with-ffi/tags))
- PHP FFI extension
- Composer 2

This Dockerfile is automagically built on [Docker Hub](https://hub.docker.com/r/rechtlogisch/php-with-ffi). Currently, only for the linux/amd64 platform. A separately hosted script checks for the newest stable PHP versions at ~5am UTC every day and triggers builds, when a new official PHP docker image is available.

# Usage

Feel free to use `rechtlogisch/php-with-ffi` with any Pipeline of your choice. You'll find usage examples in the [Wiki](../../wiki) for the following service providers:

* [Bitbucket](../../wiki/Bitbucket-Pipeline)
* [GitLab](../../wiki/GitLab-Pipeline)

## PHP modules included

* [List of PHP modules](../../wiki/List-of-PHP-modules)

## Changelog

Please see [Releases](../../releases) for more information on what has changed recently.

## Contributing

Please see [CONTRIBUTING](.github/CONTRIBUTING.md) for details.

## Security Vulnerabilities

Please review [our security policy](../../security/policy) on how to report security vulnerabilities.

## Credits

- [Krzysztof Tomasz Zembrowski](https://github.com/zembrowski)
- [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
