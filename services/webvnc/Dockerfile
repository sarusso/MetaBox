FROM metabox/base
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>
# Thanks to Doro Wu <fcwu.tw@gmail.com>

# Web VNC (noVNC) v0.6.1.
#TODO: this is a custom version from Doro Wu. Check differences and maybe move to 0.6.2
COPY noVNC.tar.gz /usr/lib/
RUN cd /usr/lib/ && tar -zxvf noVNC.tar.gz
COPY index.html /usr/lib/noVNC

# Supervisord configuration
COPY supervisord_webvnc.conf /etc/supervisor/conf.d/

# Prestartup
COPY prestartup_webvnc.sh /prestartup/

# reyns: expose 8590/tcp
