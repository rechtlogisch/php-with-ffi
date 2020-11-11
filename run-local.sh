#!/bin/bash

SUBPATH=$1
COMMAND=$2

docker run -it \
  --rm \
  --name ffier \
  --mount type=bind,source="$(pwd)"/"$SUBPATH",target=/var/www \
  ffier:latest \
  $COMMAND
