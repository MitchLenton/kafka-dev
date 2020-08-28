# kafka-dev

![Docker](https://github.com/MitchLenton/kafka-dev/workflows/Docker/badge.svg)

## Description

Creates a lightweight kafka docker container for use during development. It uses alpine linux in order to reduce the container size.

## Instructions

### Build

```bash
docker build --pull --rm -f "Dockerfile" -t kafkadev:latest "."
```

### Run

```bash
docker run --rm -p 2181:2181/tcp -p 9092:9092/tcp kafkadev:latest
```

## Build Args

These can be replaced using the `--build-arg VAR=<VALUE>` flag when using `docker build`.

```bash
KAFKA_VERSION="2.6.0"
SCALA_VERSION="2.13"
```

## Environment Variables

These can be replaced using the `-e VAR=<VALUE>` flag when using `docker run`.

```bash
KAFKA_BROKER_ID="0"
KAFKA_LOG_DIR="/var/log/kafka"
KAFKA_PARTITIONS="1"
KAFKA_LISTENERS="INTERNAL://localhost:9090,EXTERNAL://:9092"
KAFKA_ADVERTISED_LISTENERS="INTERNAL://localhost:9090,EXTERNAL://localhost:9092"
KAFKA_PROTOCOL_MAP="INTERNAL:PLAINTEXT,EXTERNAL:PLAINTEXT"
KAFKA_LISTENER_NAME="INTERNAL"
```
