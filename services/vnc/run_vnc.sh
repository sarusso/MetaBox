#!/bin/bash

# If VNC_USER is not set, derive it from instance.
if [[ "x$VNC_USER" == "x" ]] ; then
    VNC_USER=$INSTANCE    
fi

# If user does not exists, fallback to metabox user
if [[ "x$(id -u $VNC_USER)" == "x" ]] ; then
	echo "WARNING: user \"$VNC_USER\" does not exist, falling back on \"metauser\" user"
    VNC_USER=metauser
fi

echo "VNC_USER: $VNC_USER"

# Exec TigerVNC server as this instance user
sudo -i -u $VNC_USER /opt/tigervnc/usr/bin/vncserver :0 -SecurityTypes None -xstartup /opt/tigervnc/xstartup

# Check it is running and if no, exit
while true
do

    PSOUT=$(ps -ef | grep /opt/tigervnc/usr/bin/Xvnc | grep SecurityTypes) 

    if [[ "x$PSOUT" == "x" ]] ; then
        exit 1
    fi

	# Sleep other 10 secs before re-checking
	sleep 10

done
