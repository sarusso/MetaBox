#!/bin/bash

# Exec TigerVNC server
/opt/tigervnc/usr/bin/vncserver :0 -SecurityTypes None -xstartup /opt/tigervnc/xstartup

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
