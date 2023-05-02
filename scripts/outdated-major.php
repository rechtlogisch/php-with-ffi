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
    echo 'The project seems to not contain a composer.json file. Script could not run' . PHP_EOL;
    exit(10);
}

$output = shell_exec('composer outdated --direct --major-only --format=json');

try {
    $json = json_decode($output, false, 512, JSON_THROW_ON_ERROR);
} catch (JsonException $e) {
    echo 'Error while decoding composer output to json. Exception message: ' . $e->getMessage() . PHP_EOL;
    exit(11);
}

$dependencies = $json->installed;
$outdated = 0;

foreach ($dependencies as $dependency) {
    // skip non-direct dependencies
    if ($dependency->{'direct-dependency'} !== true) {
        continue;
    }

    // ignore dev versions
    if (str_contains($dependency->latest, '-dev')) {
        continue;
    }

    echo "{$dependency->name} {$dependency->version} ~ {$dependency->latest} {$dependency->description}" . PHP_EOL;
    $outdated++;
}

if ($outdated > 0) {
    $textDependency = ($outdated === 1)
        ? 'dependency'
        : 'dependencies';
    echo "Outdated major {$textDependency} detected: {$outdated}" . PHP_EOL;
}

// Reaching this point means no relevant outdated dependencies
echo 'No outdated major dependencies found' . PHP_EOL;
exit(0);
