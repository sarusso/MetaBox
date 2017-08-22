FROM metabox/vnc
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install Tab Window Manager 
RUN apt-get install twm -y

# X startup
COPY xstartup /opt/tigervnc/
RUN chmod 755 /opt/tigervnc/xstartup

# Prestartup
COPY prestartup_twm.sh /prestartup/

# reyns: expose 8590/tcp
# reyns: expose 5900/tcp
