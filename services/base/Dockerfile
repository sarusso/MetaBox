FROM reyns/reyns-base-ubuntu14.04
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Update apt here so if the prject is build without cache we get a refresh
RUN apt-get update

# Create the media user (used for audio/video serivces)
# We chose GID 65527 and UID 65528 to try avoiding conflicts.
RUN groupadd -g 65528 media
RUN useradd media -d /media -u 65528 -g 65528 -m -s /bin/bash

# Add the media user to the www-data group (to allow access to certain folders from web)
#RUN usermod -a -G www-data media

# Create your users here. You can just keep the metabox user, change it, or add your entire family.
RUN useradd metabox -m -s /bin/bash     # UID=1001
#RUN useradd anotheruser -m -s /bin/bash     # UID=1002

# Add user metabox to sudo
RUN adduser metabox sudo

# Note 1: if you use the Samba service, you need to add the users even there.
# Note 2: vnc desktops still do not support multiuser.
