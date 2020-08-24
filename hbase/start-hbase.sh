#!/bin/bash

# Create logs directory (see hbase-env.sh)
mkdir -p logs

# Start HBase master (will start region server)
/usr/local/hbase/bin/start-hbase.sh
tail -F logs/*

# TODO: restart hbase if exits but trap CTRL-C
