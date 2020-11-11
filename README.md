# PHP with FFI

A custom image for Bitbucket Pipelines including Composer and the PHP FFI extension.  

Based on the current stable PHP CLI.

Features:
- Composer 2
- PHP FFI extension

This Dockerfile is automagically built on [Docker Hub](https://hub.docker.com/r/rechtlogisch/ffier)

# Usage

Enable Pipelines in `Repository settings` > `Pipelines` > `Settings`.

Add `bitbucket-pipelines.yml` to your repository.

Example:
```
image: rechtlogisch/ffier

pipelines:
  default:
    - step:
        name: Test
        caches:
          - composer
        script:
          - composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts 
          - composer test
```

To run tests with `composer test` add for example `vendor/bin/pest` to the `scripts` property of your `composer.json` (cf. [Composer documentation](https://getcomposer.org/doc/articles/scripts.md#defining-scripts) and [Pest PHP](https://pestphp.com))

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
