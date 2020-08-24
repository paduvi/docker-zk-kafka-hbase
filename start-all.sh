#!/bin/bash -eu
export HOSTNAME
export KAFKA_ADVERTISED_HOST=$(hostname)
docker-compose up --build
