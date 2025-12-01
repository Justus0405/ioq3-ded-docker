#!/usr/bin/env bash

docker run -it --rm -v ./baseq3:/home/ioq3srv/.config/Quake3/baseq3 --entrypoint sh ioq3-ded-docker-ioq3-ded:latest
