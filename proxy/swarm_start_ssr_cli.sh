#! /bin/bash

docker service create \
	--name proxy_ssr_cli \
	--hostname proxy_ssr_cli \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 1080:1080 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/shadowsocksr:3.3.3 ssrlocal -s VPS_IP -p 443 -k PASSWORD -b 0.0.0.0 -l 1080 -m aes-128-ctr -o tls1.2_ticket_auth_compatible -O auth_aes128_sha1
