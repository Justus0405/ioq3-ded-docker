#!/bin/sh

netstat -uln | grep 27960 || exit 1
