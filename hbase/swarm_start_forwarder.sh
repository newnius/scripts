#!/bin/bash

docker service create \
	--name hbase-forwarder \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hbase-master \
	--env REMOTE_PORT=9090 \
	--env LOCAL_PORT=9090 \
	--publish mode=host,published=9090,target=9090 \
	newnius/port-forward
