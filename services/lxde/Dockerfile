FROM metabox/twm
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>
# Thanks to Doro Wu <fcwu.tw@gmail.com>

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

# Replace X startup with version that uses Xfce as Window Manager
COPY xstartup /opt/tigervnc/
RUN chmod 755 /opt/tigervnc/xstartup

#EXPOSE_AS   80, 8591
#EXPOSE_AS 5900, 5901

