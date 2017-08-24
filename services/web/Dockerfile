FROM metabox/base
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

###################################
#
#            A P A C H E
#
###################################

# Install Apache
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install apache2-utils

# Copy conf
COPY supervisord_apache.conf /etc/supervisor/conf.d/
COPY run_Apache.sh /etc/supervisor/conf.d/
RUN chmod 755 /etc/supervisor/conf.d/run_Apache.sh

# Enable mod_proxy and SSL
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN sudo a2enmod ssl
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod proxy_wstunnel
 
# Copy and enable conf for proxy
COPY 001-proxy.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/001-proxy.conf /etc/apache2/sites-enabled/001-proxy.conf

# We overwrite default Apache conf as we force https
COPY 000-default.conf /etc/apache2/sites-available/

# The following is not really necessary as defaults are ok (it is the original file)
COPY default-ssl.conf /etc/apache2/sites-available/

# Copy index
COPY index.html /var/www/html/

# Listen also on port 8088
RUN echo "listen 8088" >> /etc/apache2/ports.conf

# Web user/pass
RUN cd /data && htpasswd -bc htpasswd metauser metapass #Set password metapass for user metauser
RUN ln -s /data/htpasswd /etc/apache2/htpasswd

# Prestartup
COPY prestartup_proxy.sh /prestartup/

# reyns: expose 80/tcp
# reyns: expose 443/tcp
# reyns: expose 8088/tcp
