#! /bin/bash

docker service create \
--name tinyproxy \
--constraint node.hostname==ubuntu-15 \
--publish mode=host,published=8888,target=8888 \
--mount type=bind,source=/mnt/data/tinyproxy,target=/etc/tinyproxy \
newnius/tinyproxy
