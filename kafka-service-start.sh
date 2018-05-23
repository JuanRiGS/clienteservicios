#!/bin/bash
##inicio Kafka

echo "clean kafka data"
#sudo rm -rf ${path_data}/data
#sudo mkdir ${path_data}/data
echo "start kafka nodes & producers/consumers"
sudo /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties &
sudo /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server-1.properties &
sudo /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic broker-replicated &
sudo /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9093 --topic broker-replicated2 &
sudo /opt/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --from-beginning --topic broker-replicated &
sudo /opt/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --from-beginning --topic broker-replicated

