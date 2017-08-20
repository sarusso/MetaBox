FROM metabox/vnc
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install Xfce (Forcing avoids problems like "10" owners/error: "shared/packages-wordlist doesn't exist")
RUN apt-get install --force-yes --no-install-recommends xfce4 xfce4-terminal mousepad ristretto tumbler gnome-icon-theme-full tango-icon-theme firefox -y

# Remove xterm as it only create confusion in the menus..
RUN apt-get remove xterm -y

# Replace X startup with version that uses Xfce as Window Manager
COPY xstartup /opt/tigervnc/
RUN chmod 755 /opt/tigervnc/xstartup

# Prestartup
COPY prestartup_xfce.sh /prestartup/

# Default conf (mostly eyecandy)
COPY home_metauser_.config /home/metauser/.config
RUN chown -R metauser:metauser /home/metauser/.config

EXPOSE 8590 5900
