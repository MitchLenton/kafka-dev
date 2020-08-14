FROM alpine:3.12

ENV KAFKA_VERSION="2.6.0"
ENV SCALA_VERSION="2.13"

RUN apk add --update bash curl openjdk8

WORKDIR /app

RUN curl http://apache.mirror.iweb.ca/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -o kafka.tgz && \
    tar -xzf kafka.tgz -C /usr/local/ && \
    rm -rf kafka.tgz

ENV KAFKA_HOME="/usr/local/kafka_${SCALA_VERSION}-${KAFKA_VERSION}"
ENV PATH=$PATH:${KAFKA_HOME}/bin

VOLUME [ "/kafka_data" ]

COPY launch.sh .
RUN chmod +x launch.sh

COPY server.properties $KAFKA_HOME/config/server.properties
COPY zookeeper.properties $KAFKA_HOME/config/zookeeper.properties

EXPOSE 9092 2181

CMD [ "/bin/bash", "launch.sh" ]