FROM metabox/base
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install Samba
RUN apt-get update
RUN apt-get install -y samba

# Copy conf
COPY smb.conf /etc/samba/smb.conf 

# Create samba users. Linux user MUST exists!
RUN (echo metapass; echo metapass) | smbpasswd -a metauser


# Setup supervisord
COPY supervisord_smbd.conf /etc/supervisor/conf.d/
COPY supervisord_nmbd.conf /etc/supervisor/conf.d/

# reyns: expose 445/tcp

