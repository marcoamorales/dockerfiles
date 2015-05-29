FROM ubuntu:trusty

ENV LANG en_US.UTF-8

RUN apt-get update -q && \
    apt-get install -qy openjdk-7-jre-headless

ADD https://downloads.sourceforge.net/project/subsonic/subsonic/5.2.1/subsonic-5.2.1.deb /tmp/subsonic.deb
RUN dpkg -i /tmp/subsonic.deb && \
    rm -rf /tmp/subsonic.deb

# Don't fork to the background
RUN sed -i "s/ > \${LOG} 2>&1 &//" /usr/share/subsonic/subsonic.sh
RUN sed -i "s/SUBSONIC_HTTPS_PORT=0/SUBSONIC_HTTPS_PORT=4443/" /usr/share/subsonic/subsonic.sh
RUN sed -i "s/SUBSONIC_HOME=\/var\/subsonic/SUBSONIC_HOME=\/conf/" /usr/share/subsonic/subsonic.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/data", "/conf"]
EXPOSE 4443

ENTRYPOINT [ "/start.sh" ]