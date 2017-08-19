# MetaBox
A collection of plug-and-play services for your Box



## Build

    $ metabox/build all

## Run

    $ metabox/run all

## SSH

    $ metabox/ssh service_name (user automatically set to metauser)


## Authentication

Default password for Proxy and Samba services: "metapass". Change them!! User is "metauser" as for SSH.

For Proxy (with "proxy" service running):

    $ metabox/ssh proxy
    $ cd /data && sudo htpasswd -bc htpasswd metabox yourpass
    $ exit
    $ metabox/rerun proxy

For Samba (with "samba" service running):

    $ metabox/ssh samba
    $ sudo bash -c "(echo yourpass; echo yourpass) | smbpasswd -a metauser"
    $ exit
    $ metabox/rerun samba

## Stop

    $ metabox/stop all

