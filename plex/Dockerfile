FROM debian:wheezy
MAINTAINER Tim Haak <tim@haak.co.uk>
#Thanks to https://github.com/bydavy/docker-plex/blob/master/Dockerfile and https://github.com/aostanin/docker-plex/blob/master/Dockerfile

ENV DEBIAN_FRONTEND="noninteractive" \
    LANG="en_US.UTF-8" \
    LC_ALL="C.UTF-8" \
    LANGUAGE="en_US.UTF-8"

RUN apt-get -q update && \
    apt-get install -qy --force-yes curl adduser && \
    curl -L 'https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu' -o /tmp/plexmediaserver.deb && \
    dpkg -i /tmp/plexmediaserver.deb && rm -f /tmp/plexmediaserver.deb && \
    apt-get install -qy --force-yes supervisor ca-certificates procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/config","/data"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN useradd -u 2000 xmedia

EXPOSE 32400

CMD ["/start.sh"]
