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

# Create base matauser user. We assign the same UID as the user who is building MetaBox to minimize permissions problems.
RUN useradd metauser -m -s /bin/bash # UID=1000 (if not taken)

# Create other users here. You can just keep the metauser user, change it above, or add your entire family.
#RUN useradd anotheruser1 -m -s /bin/bash # UID=1001 (if not taken)
#RUN useradd anotheruser2 -m -s /bin/bash # UID=1002 (if not taken)

# Add user metauser to sudo
RUN adduser metauser sudo

# Prestartup
COPY prestartup_base.sh /prestartup/

# Disable reyns user over ssh to allow exposing ssh on a public IP (i.e. for the Desktop service)
RUN echo "DenyUsers reyns" >> /etc/ssh/sshd_config

# Add metabox rsa key
COPY keys/metauser.rsa.pub /etc/ssh/metauser.rsa.pub
RUN sudo mkdir -p /home/metauser/.ssh && ln -s /etc/ssh/metauser.rsa.pub /home/metauser/.ssh/authorized_keys && chown -R metauser:metauser /home/metauser/.ssh

# Note 1: If you use the Samba service, you need to achange/dd the users even there.
# Note 2: If you use the Vnc desktop service, you need to change/add the users even there.
# Note 3: Vnc desktop still do not support multiuser.
