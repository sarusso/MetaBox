FROM reyns/reyns-base-ubuntu14.04
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Create the media user (used for audio/video serivces)
RUN useradd media -m -s /bin/bash   # UID=1001

# Add the media user to the www-data group (to allow access to certain folders from web)
RUN usermod -a -G www-data media

# Create your users here. You can just keep the metabox user, change it, or add your enitre family.
RUN useradd metabox -m -s /bin/bash     # UID=1002

# Note 1: if you use the Samba service, you need to add the users even there.
# Note 2: vnc desktops still do not support multiuser.
