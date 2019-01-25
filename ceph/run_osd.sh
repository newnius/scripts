#!/bin/bash

docker run \
	--name=ceph_osd \
	-d \
	--net=host \
	--restart=always \
	-v /etc/localtime:/etc/localtime \
	-v /data/ceph/etc:/etc/ceph \
	-v /data/ceph/lib:/var/lib/ceph/ \
	ceph/daemon osd_directory
