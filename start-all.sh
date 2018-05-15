#!/bin/bash -eu

SHOULD_BUILD=$(docker images | grep -c 'lee51/hbase' || echo)
if [[ $SHOULD_BUILD -lt 1 ]]; then
  docker-compose build
fi

export HOSTNAME
export KAFKA_ADVERTISED_HOST=$(hostname)
docker-compose up -V
