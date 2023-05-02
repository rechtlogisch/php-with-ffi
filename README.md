# PHP with FFI

[![GitHub Workflow actions](https://github.com/rechtlogisch/php-with-ffi/workflows/Build%20and%20publish%20Docker%20images/badge.svg)](https://github.com/rechtlogisch/php-with-ffi/actions)
[![Tags](https://ghcr-badge.deta.dev/rechtlogisch/php-with-ffi/tags)](https://github.com/rechtlogisch/php-with-ffi/pkgs/container/php-with-ffi)
[![Size](https://ghcr-badge.deta.dev/rechtlogisch/php-with-ffi/size?tag=latest)](https://github.com/rechtlogisch/php-with-ffi/pkgs/container/php-with-ffi/79215656?tag=latest)

A custom image for CI Pipelines including the PHP FFI extension and Composer.

Based on the currently supported PHP versions (base image defaults to: [cli](https://github.com/docker-library/docs/blob/master/php/README.md#supported-tags-and-respective-dockerfile-links)).

Features:
- PHP 8.2 / PHP 8.1 / PHP 8.0 (based on [tags](https://github.com/rechtlogisch/php-with-ffi/pkgs/container/php-with-ffi))
- [PHP FFI](https://www.php.net/manual/en/book.ffi.php) extension
- [Composer 2](https://getcomposer.org/)

This Dockerfile is automagically built with a [GitHub Workflow](.github/workflows/build-and-publish.yml). Currently, only for the linux/amd64 platform. A separately hosted script checks for the newest stable PHP versions at ~5am UTC every day and triggers builds, when a new official PHP docker image is available.

# Usage

Feel free to use `ghcr.io/rechtlogisch/php-with-ffi` or `rechtlogisch/php-with-ffi` with any Pipeline of your choice. You'll find usage examples in the [Wiki](../../wiki) for the following service providers:

* [Bitbucket](../../wiki/Bitbucket-Pipeline)
* [GitLab](../../wiki/GitLab-Pipeline)

## PHP modules included

* [List of PHP modules](../../wiki/List-of-PHP-modules)

## Contributing

Please see [CONTRIBUTING](.github/CONTRIBUTING.md) for details.

## Security Vulnerabilities

Please review [our security policy](../../security/policy) on how to report security vulnerabilities.

## Credits

- [Krzysztof Tomasz Zembrowski](https://github.com/zembrowski)
- [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
