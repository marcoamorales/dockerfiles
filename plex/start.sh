#!/bin/bash -eux
GROUP=plextmp

mkdir -p /config/logs/supervisor
chown -R xmedia:xmedia /config

touch /supervisord.log
touch /supervisord.pid
chown xmedia:xmedia /supervisord.log /supervisord.pid


# Will change all files in directory to be readable by group
if [ "${CHANGE_DIR_RIGHTS}" = true ]; then
  chgrp -R ${GROUP} /data
  chmod -R g+rX /data
fi

# Current defaults to run as root while testing.
if [ "${RUN_AS_ROOT}" = true ]; then
  /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
else
  su xmedia -c "/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf"
fi
