#! /bin/bash

if [ -d /shared ]; then

    # Check if no one initialized the shared folder for metauser
    if [ ! -d /shared/metauser ]; then
        mkdir /shared/metauser
        chown metauser:metauser /shared/metauser
    fi

    # Check if there is no Data link in metauser home folder
    if [ ! -e /home/metauser/Data ]; then
        ln -s /shared/metauser /home/metauser/Data
    fi

else
    
    # If there is no shared data but link is present, remove it to avoid confusion.
    if [ -e /home/metauser/Data ]; then
        rm /home/metauser/Data
    fi
 
fi