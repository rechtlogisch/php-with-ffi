#!/usr/bin/env php
<?php

/**
 * Intended behaviour:
 *  Inform only when direct major version updates are available
 *  Major version changes (yellow) are relevant
 *  Minor version changes (red) are irrelevant
 */

declare(strict_types=1);

// prevent from running without composer.json
if (! file_exists('composer.json')) {
    echo 'The project seems to not contain a composer.json file. Script could not run.' . PHP_EOL;
    exit(10);
}

$output = shell_exec('composer outdated --direct --major-only --format=json');
if (empty($output)) {
    echo 'Output of `composer outdated` is empty. Something went wrong while running the command.'. PHP_EOL;
    exit(11);
}

try {
    $json = json_decode($output, false, 512, JSON_THROW_ON_ERROR);
} catch (JsonException $e) {
    echo 'Error while decoding composer output to json. Exception message: ' . $e->getMessage() . PHP_EOL;
    exit(12);
}

$installed = $json->installed ?? null;
if ($installed === null) {
    echo 'Could not find any installed dependencies. Stopping.' . PHP_EOL;
    exit(13);
}

$outdated = 0;

foreach ($installed as $dependency) {
    // skip non-direct dependencies
    if ($dependency->{'direct-dependency'} !== true) {
        continue;
    }

    // ignore dev versions
    if (preg_match('/(dev-|-dev)/', $dependency->latest) === 1) {
        continue;
    }

    echo "{$dependency->name} {$dependency->version} ~ {$dependency->latest} {$dependency->description}" . PHP_EOL;
    $outdated++;
}

if ($outdated > 0) {
    $textDependency = ($outdated === 1)
        ? 'dependency'
        : 'dependencies';
    echo "Outdated major {$textDependency} found: {$outdated}" . PHP_EOL;
    exit(1);
}

// Reaching this point means no relevant outdated dependencies
echo 'No outdated direct major dependencies found' . PHP_EOL;
exit(0);
