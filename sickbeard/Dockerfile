FROM ubuntu:trusty
#Thanks to https://github.com/user419/docker-sickbeard and https://github.com/GeoffreyPlitt/docker-sickbeard
MAINTAINER Tim Haak <tim@haak.co.uk>

ENV SICKBEARD_VERSION master

RUN apt-get -q update &&\
    apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes python-cheetah wget tar ca-certificates curl

RUN curl -L https://github.com/midgetspy/Sick-Beard/tarball/$SICKBEARD_VERSION -o sickbeard.tgz && \
 tar -xvf sickbeard.tgz -C /  &&\
 mv /midgetspy-Sick-Beard-* /sickbeard/ &&\
 rm  /sickbeard.tgz

# bad
RUN chmod 777 -R /sickbeard

# apt clean
RUN apt-get clean &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /tmp/*

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

RUN useradd -u 2000 xmedia
USER xmedia

EXPOSE 8081

CMD ["/start.sh"]
