#!/bin/bash

docker run \
	--name spotify \
	-it \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	--device /dev/snd \
	jess/spotify
