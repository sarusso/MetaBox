FROM metabox/base
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Install Samba
RUN apt-get update
RUN apt-get install -y samba

# Copy conf
COPY smb.conf /etc/samba/smb.conf 

# Create samba users
RUN (echo reyns; echo reyns) | smbpasswd -a reyns # Linux user MUST exists!
RUN (echo media; echo media) | smbpasswd -a media # Linux user MUST exists!


# Setup supervisord
COPY supervisord_smbd.conf /etc/supervisor/conf.d/
COPY supervisord_nmbd.conf /etc/supervisor/conf.d/

EXPOSE 445 

