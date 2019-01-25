#!/bin/bash

# not executable
exit 1

mkdir -p /data/ceph/etc

mkdir -p /data/ceph/lib

scp -r /data/ceph/ 192.168.1.2:/data

mkdir /dfs

mount -t ceph 192.168.1.1:6789:/ /dfs -o name=admin,secret=

docker rm -f ceph_mon ceph_mgr ceph_mds ceph_osd

# rm -rf /data/ceph


/data/ceph/etc/ceph.conf

osd max object name len = 256
osd max object namespace len = 64 
