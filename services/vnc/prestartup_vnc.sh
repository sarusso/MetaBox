#!/bin/bash

#echo "VNC_PASSWORD: $VNC_PASSWORD"
#if [ -n "$VNC_PASSWORD" ]; then
#    echo -n "$VNC_PASSWORD" > /.password1
#    x11vnc -storepasswd $(cat /.password1) /.password2
#    chmod 744 /.password*
#    sed -i 's/^command=x11vnc.*/& -rfbauth \/.password2/' /etc/supervisor/conf.d/supervisord_vnc.conf
#fi
