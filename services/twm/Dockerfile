FROM metabox/webvnc
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>
# Thanks to Doro Wu <fcwu.tw@gmail.com>

# Install base packages for VNC server and headless desktop (x11vnc not used as we use TigerVNC)
RUN apt-get install x11vnc xvfb xterm twm -y

# Install base packages for VNC server and headless desktop (2)
RUN cd /opt && wget https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.8.0.x86_64.tar.gz -O tigervnc-1.8.0.x86_64.tar.gz && tar -zxvf tigervnc-1.8.0.x86_64.tar.gz

# Supervisord configuration
COPY supervisord_vnc.conf /etc/supervisor/conf.d/
COPY run_vnc.sh /etc/supervisor/conf.d/
RUN chmod 755 /etc/supervisor/conf.d/run_vnc.sh

#xstartup
RUN mkdir /home/metabox/.vnc
COPY home_metabox_.xstartup /home/metabox/.xstartup
RUN chown -R metabox:metabox /home/metabox/ && chmod 755 /home/metabox/.xstartup

# Prestartup
COPY prestartup_vnc.sh /prestartup/

#EXPOSE_AS   80, 8592
#EXPOSE_AS 5900, 5902
