#!/bin/bash

# renew certiticate
docker run \
	--name certbot \
	-it \
	--rm \
	-v "/data/ssl/:/etc/letsencrypt" \
	-v "/data/apache:/var/www/html" \
	certbot/certbot certonly -n --no-eff-email --email admin@example.com --agree-tos --webroot -w /var/www/html -d example.com


# reload nginx

id=$(docker service ps nginx --no-trunc | sed -n '2p' | awk '{print $1}')

name="nginx.1.$id"

docker kill $name
