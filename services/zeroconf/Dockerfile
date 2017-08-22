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

# Disable ssh as this image will be run in "net host" mode
RUN mv /etc/supervisor/conf.d/supervisord_sshd.conf /etc/supervisor/conf.d/supervisord_sshd.conf_disbaled

# reyns: expose 5353/udp
