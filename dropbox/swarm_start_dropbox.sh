#!/bin/bash

docker service create \
	--name dropbox \
	--hostname dropbox \
	--replicas 1 \
	--detach=true \
	--limit-cpu 0.25 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/home/dropbox/.dropbox,target=/root/.dropbox \
	--mount type=bind,source=/data/,target=/root/Dropbox/data \
	newnius/dropbox
