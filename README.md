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
