FROM metabox/base
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install avahi for network service discovery
RUN apt-get update
RUN wget https://www.vpn.net/installers/logmein-hamachi_2.1.0.174-1_amd64.deb
RUN dpkg -i logmein-hamachi_2.1.0.174-1_amd64.deb

# Setup supervisord
COPY supervisord_hamachi.conf /etc/supervisor/conf.d/

# Prestartup
COPY prestartup_hamachi.sh /prestartup/

# Move Hamachi config dir to data folder to allow persistency
RUN mv /var/lib/logmein-hamachi /data/logmein-hamachi
RUN ln -s /data/logmein-hamachi /var/lib/logmein-hamachi

# Disable ssh as this image will be run in "net host" mode
RUN mv /etc/supervisor/conf.d/supervisord_sshd.conf /etc/supervisor/conf.d/supervisord_sshd.conf_disbaled

# reyns: privileged
