# kafka-dev

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
