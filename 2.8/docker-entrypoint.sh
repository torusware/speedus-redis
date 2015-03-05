#!/bin/bash
set -e

if [ "$1" = 'redis-server' ]; then
	chown -R redis .
	exec speedus gosu redis "$@"
fi
cd /root/
exec "$@"
