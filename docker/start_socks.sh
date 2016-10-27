#! /bin/bash

docker service create \
--replicas 1 \
--name socks \
--network my-network \
-p 7001:7001 \
--mount type=bind,src=/mnt/Data/ssh-configs,dst=/ssh \
jdeathe/centos-ssh bash /ssh/start.sh


