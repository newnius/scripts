#! /bin/bash

docker service create \
	--name proxy_ss_cli \
	--hostname proxy_ss_cli \
	--replicas 1 \
	--detach=true \
	--publish 1080:1080 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	mritd/shadowsocks -m "ss-local" -s "-s SERVER -p 8844 -b 0.0.0 -l 1080 -k PASSWORD -m aes-256-cfb"
