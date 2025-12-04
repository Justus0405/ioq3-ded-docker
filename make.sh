#!/usr/bin/env bash

mkdir baseq3

clear && docker-compose down --timeout 0 && docker-compose up -d --build && docker-compose logs --follow
