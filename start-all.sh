#!/bin/bash -eu
export HOSTNAME
docker-compose up "$@"
