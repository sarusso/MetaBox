FROM metabox/base
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install avahi for network service discovery
RUN apt-get update
RUN apt-get install -y avahi-daemon

# Copy conf
COPY samba.service /etc/avahi/services/samba.service
COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

# Setup supervisord
COPY supervisord_avahi.conf /etc/supervisor/conf.d/


#UDPEXPOSE 5353
