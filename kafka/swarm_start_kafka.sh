#!/bin/bash

docker service create \
	--name kafka-node1 \
	--hostname kafka-node1 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env BROKER_ID=1 \
	--env ZOOKEEPER_CONNECT=zookeeper-node1:2181,zookeeper-node2:2181,zookeeper-node3:2181 \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	newnius/kafka:2.2


docker service create \
	--name kafka-node2 \
	--hostname kafka-node2 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env BROKER_ID=2 \
	--env ZOOKEEPER_CONNECT=zookeeper-node1:2181,zookeeper-node2:2181,zookeeper-node3:2181 \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	newnius/kafka:2.2


docker service create \
	--name kafka-node3 \
	--hostname kafka-node3 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env BROKER_ID=3 \
	--env ZOOKEEPER_CONNECT=zookeeper-node1:2181,zookeeper-node2:2181,zookeeper-node3:2181 \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	newnius/kafka:2.2

