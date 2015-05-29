#! /bin/sh

cd /CouchPotatoServer
touch /config/CouchPotato.cfg

chown xmedia:xmedia /config/CouchPotato.cfg

su xmedia -c /usr/bin/python /CouchPotatoServer/CouchPotato.py --data_dir /data/ --config_file /config/CouchPotato.cfg --console_log
