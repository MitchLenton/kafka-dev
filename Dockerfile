FROM alpine:3.12

ARG KAFKA_VERSION="2.6.0"
ARG SCALA_VERSION="2.13"

ENV KAFKA_BROKER_ID="0" \
    KAFKA_LOG_DIR="/var/log/kafka" \
    KAFKA_PARTITIONS="1" \
    KAFKA_LISTENERS="INTERNAL://localhost:9090,EXTERNAL://:9092" \
    KAFKA_ADVERTISED_LISTENERS="INTERNAL://localhost:9090,EXTERNAL://localhost:9092" \
    KAFKA_PROTOCOL_MAP="INTERNAL:PLAINTEXT,EXTERNAL:PLAINTEXT" \
    KAFKA_LISTENER_NAME="INTERNAL"

RUN apk add --update bash curl openjdk8

WORKDIR /app

RUN curl http://apache.mirror.iweb.ca/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -o kafka.tgz && \
    tar -xzf kafka.tgz -C /usr/local/ && \
    rm -rf kafka.tgz

ENV KAFKA_HOME="/usr/local/kafka_${SCALA_VERSION}-${KAFKA_VERSION}"
ENV PATH=$PATH:${KAFKA_HOME}/bin

VOLUME [ ${KAFKA_LOG_DIR} ]

COPY scripts/launch.sh .
RUN chmod +x launch.sh

COPY config/server.properties $KAFKA_HOME/config/server.properties
COPY config/zookeeper.properties $KAFKA_HOME/config/zookeeper.properties

EXPOSE 9092 2181

CMD [ "/bin/bash", "launch.sh" ]