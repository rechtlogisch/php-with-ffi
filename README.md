# PHP with FFI

[![Docker Cloud automated build](https://img.shields.io/docker/cloud/automated/rechtlogisch/ffier)](https://hub.docker.com/r/rechtlogisch/ffier)
[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/rechtlogisch/ffier)](https://hub.docker.com/r/rechtlogisch/ffier/builds)
[![Docker image size and layers](https://images.microbadger.com/badges/image/rechtlogisch/ffier.svg)](https://hub.docker.com/r/rechtlogisch/ffier/tags)

A custom image for CI Pipelines including Composer and the PHP FFI extension.  

Based on the current stable PHP CLI ([cli](https://github.com/docker-library/docs/blob/master/php/README.md#supported-tags-and-respective-dockerfile-links)).

Features:
- Composer 2
- PHP FFI extension

This Dockerfile is automagically built on [Docker Hub](https://hub.docker.com/r/rechtlogisch/ffier). A separately hosted script checks for a new stable PHP version at ~5am UTC every day and triggers a new build, when necessary.

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
