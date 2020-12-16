# PHP with FFI

[![Docker Cloud automated build](https://img.shields.io/docker/cloud/automated/rechtlogisch/ffier)](https://hub.docker.com/r/rechtlogisch/ffier)
[![GitHub Workflow actions](https://github.com/rechtlogisch/ffier/workflows/Publish%20images/badge.svg)](https://github.com/rechtlogisch/ffier/actions)
[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/rechtlogisch/ffier)](https://hub.docker.com/r/rechtlogisch/ffier/builds)
[![Docker image size :latest](https://img.shields.io/docker/image-size/rechtlogisch/ffier/latest)](https://hub.docker.com/r/rechtlogisch/ffier/tags)
[![Docker image layers :latest](https://img.shields.io/microbadger/layers/rechtlogisch/ffier)](https://hub.docker.com/r/rechtlogisch/ffier/tags)

A custom image for CI Pipelines including Composer and the PHP FFI extension.  

Based on the currently supported stable PHP CLI ([cli](https://github.com/docker-library/docs/blob/master/php/README.md#supported-tags-and-respective-dockerfile-links)).

Features:
- PHP 8 / PHP 7.4 (based on [tags](https://hub.docker.com/repository/docker/rechtlogisch/ffier/tags))
- Composer 2
- PHP FFI extension

This Dockerfile is automagically built on [Docker Hub](https://hub.docker.com/r/rechtlogisch/ffier). Currently, only for the linux/amd64 platform. A separately hosted script checks for the newest stable PHP versions at ~5am UTC every day and triggers builds, when necessary.

# Usage

Feel free to use `rechtlogisch/ffier` with any Pipeline of your choice. You'll find usage examples in the [Wiki](../../wiki) for the following service providers:

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
