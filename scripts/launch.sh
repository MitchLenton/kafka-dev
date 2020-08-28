#!/bin/bash

SERVER_CONFIG_PLACEHOLDERS=(
  "KAFKA_BROKER_ID"
  "KAFKA_LOG_DIR"
  "KAFKA_PARTITIONS"
  "KAFKA_LISTENERS"
  "KAFKA_ADVERTISED_LISTENERS"
  "KAFKA_PROTOCOL_MAP"
  "KAFKA_LISTENER_NAME"
)

for PLACEHOLDER in ${SERVER_CONFIG_PLACEHOLDERS[@]}
do
  sed -i "s#__${PLACEHOLDER}__#${!PLACEHOLDER}#" $KAFKA_HOME/config/server.properties
done

zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties &
kafka-server-start.sh $KAFKA_HOME/config/server.properties