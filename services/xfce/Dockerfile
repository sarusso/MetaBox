FROM metabox/twm
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install Xfce (Forcing avoids problems like "10" owners/error: "shared/packages-wordlist doesn't exist")
RUN apt-get install --force-yes --no-install-recommends xfce4 xfce4-terminal gnome-icon-theme-full tango-icon-theme firefox -y

# Replace X startup with version that uses Xfce as Window Manager
COPY xstartup /opt/tigervnc/
RUN chmod 755 /opt/tigervnc/xstartup

# Prestartup
COPY prestartup_xfce.sh /prestartup/

#EXPOSE_AS   80, 8590
#EXPOSE_AS 5900, 5900
