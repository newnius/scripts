#!/bin/bash

####### Configuration ##########
HOST_IP="192.168.1.1" # self ip

NETWORK="192.168.1.1/24"
################################

docker run \
	--name=ceph_mon \
	-d \
	--net=host \
	--restart=always \
	-v /data/ceph/etc:/etc/ceph \
	-v /data/ceph/lib:/var/lib/ceph \
	-v /etc/localtime:/etc/localtime \
	-e MON_IP=${HOST_IP} \
	-e CEPH_PUBLIC_NETWORK=${NETWORK} \
	ceph/daemon mon
