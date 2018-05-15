Docker environment for Zookeeper, Kafka, and HBase
==================================================

This repo contains a Docker Compose file for coordinating containers for Zookeeper, Kafka, and HBase.
Since both Kafka and HBase depend on Zookeeper for storing metadata (namespaces, table names, offsets, etc.),
a single Zookeeper service (container) is first created and used as a dependency for the other two services.

The utility of this container suite is to enable local development of applications that rely on Kafka and HBase
(and even Zookeeper) for messaging and storage. Since the Docker service for Zookeeper exposes port 2181 on the
host machine, your application can write directly to Zookeeper, which is also shared by the other services.

## Quick Start

```bash
./start-all.sh
```

The first time the `start-all.sh` script runs, it will build a Docker image for HBase. As long as the image
exists, the script will immediately continue to deploying the containers for Zookeeper, Kafka, and HBase.
The Zookeeper service exposes port 2181; the HBase service exposes port 9092 (broker), and the HBase service
exposes ports 16000 (master), 16010 (master UI), 16201 (regionserver), 16301 (regionserver UI). Furthermore,
the docker-compose file maps the exposed container ports to the corresponding ports on your host machine,
so you can run commands such as `zkCli.sh`, `kafka-topics.sh`, and `hbase shell` from your host (assuming
the libraries are available and properly configured on your host machine. Therefore, any downstream applications
can reach each of these services as if they were running directly on the host machine.
