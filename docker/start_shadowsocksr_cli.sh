#! /bin/bash

docker service create \
				--name ssr \
				--replicas 1 \
				--detach=true \
				--publish 1080:1080 \
				--network swarm-net \
				newnius/shadowsocksr:3.3.3 ssrlocal -s VPS_IP -p 443 -k PASSWORD -b 0.0.0.0 -l 1080 -m aes-128-ctr -o tls1.2_ticket_auth_compatible -O auth_aes128_sha1
