#!/bin/bash

docker run \
	--name ceph_mds \
	-d \
	--net=host \
	--restart=always \
	-v /data/ceph/lib:/var/lib/ceph/ \
	-v /data/ceph/etc:/etc/ceph \
	-v /etc/localtime:/etc/localtime \
	-e CEPHFS_CREATE=1 \
	-e CEPHFS_DATA_POOL_PG=128 \
	-e CEPHFS_METADATA_POOL_PG=128 \
	ceph/daemon mds
