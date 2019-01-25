docker run \
	--name ceph_mgr \
	-d \
	--net=host \
	--restart=always \
	-v /data/ceph/etc:/etc/ceph \
	-v /data/ceph/lib:/var/lib/ceph/ \
	-v /etc/localtime:/etc/localtime \
	ceph/daemon mgr
