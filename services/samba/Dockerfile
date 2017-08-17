FROM metabox/base
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install Samba
RUN apt-get update
RUN apt-get install -y samba

# Copy conf
COPY smb.conf /etc/samba/smb.conf 

# Create samba users. Linux user MUST exists!
RUN (echo M3tab0x!; echo M3tab0x!) | smbpasswd -a metabox


# Setup supervisord
COPY supervisord_smbd.conf /etc/supervisor/conf.d/
COPY supervisord_nmbd.conf /etc/supervisor/conf.d/

EXPOSE 445 

