#! /bin/bash

docker run \
--restart always \
-v /var/gluster/configuration:/etc/glusterfs:z \
-v /var/gluster/metadata:/var/lib/glusterd:z \
-v /var/gluster/logs:/var/log/glusterfs:z \
-v /var/gluster/data:/data \
-d \
--privileged=true \
--net=host \
--name gluster_server \
gluster/gluster-centos
