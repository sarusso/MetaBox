FROM metabox/webvnc
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>
# Thanks to Doro Wu <fcwu.tw@gmail.com>

# Install base packages for VNC server and headless desktop
RUN apt-get install x11vnc xvfb -y

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/metabox

# Install Lxde 
RUN apt-get install -y --force-yes --no-install-recommends \
        lxde \
        gtk2-engines-murrine ttf-ubuntu-font-family \
        firefox \
        fonts-wqy-microhei \
        mesa-utils libgl1-mesa-dri \
        gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine pinta

# Eyecandy
COPY home_metabox_.gtkrc-2.0 /home/metabox/.gtkrc-2.0
RUN rm /usr/share/lxpanel/images/background.png

# Setup supervisord
COPY supervisord_lxde.conf /etc/supervisor/conf.d/

# Prestartup
COPY prestartup_lxde.sh /prestartup/

#EXPOSE_AS   80, 8591
#EXPOSE_AS 5900, 5901

