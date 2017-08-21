FROM metabox/base
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install avahi for network service discovery
RUN apt-get update
RUN wget https://www.vpn.net/installers/logmein-hamachi_2.1.0.174-1_amd64.deb
RUN dpkg -i logmein-hamachi_2.1.0.174-1_amd64.deb

# Setup supervisord
COPY supervisord_hamachi.conf /etc/supervisor/conf.d/
COPY run_Hamachi.sh /etc/supervisor/conf.d/
RUN chmod 755 /etc/supervisor/conf.d/run_Hamachi.sh

# Prestartup
COPY prestartup_hamachi.sh /prestartup/


# Disable ssh as this image will be run in "net host" mode
RUN mv /etc/supervisor/conf.d/supervisord_sshd.conf /etc/supervisor/conf.d/supervisord_sshd.conf_disbaled

#UDPEXPOSE 5353