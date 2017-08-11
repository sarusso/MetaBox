FROM metabox/vnc
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install Tab Window Manager 
RUN apt-get install twm -y

# X startup
COPY xstartup /opt/tigervnc/
RUN chmod 755 /opt/tigervnc/xstartup

# Prestartup
COPY prestartup_twm.sh /prestartup/

EXPOSE 8590 5900