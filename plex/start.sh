#!/bin/bash -eux

mkdir -p /config/logs/supervisor

touch /supervisord.log
touch /supervisord.pid

chown -R xmedia:xmedia /config /supervisord.log /supervisord.pid

# Current defaults to run as root while testing.
su xmedia -c "/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf"
