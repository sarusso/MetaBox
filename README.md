# MetaBox
A collection of plug-and-play services for your Box

## Reuirements

To build MetaBox, you need Docker, Git, Python and Bash, plus Internet connectivity.

To access its services, the requirements change from service to service. In general, a modern (post 2014) OS and Web browser should work. (Note: Safari with Web Remote Desktop over https does not work due to a limitation is Safari itself)

If you make extensive use or local or remote MetaBox Desktop, you might want to try the native MetaBox Desktop App (for Windows, Mac and Linux).



## Services

* Desktop: a Xfce desktop plus VNC and web-based VNC.


* Web: web services, including access to Desktop's web-based VNC. Access it via http://localhost or http://ip_address (redirects automatically to secure connection over https)

* Files: provides access for files in the "Data" folder of metauser hoem directory trough Samba (Windows File Sharing protocol).

* Zeroconf: provides zero configuration for services discovery when running on a LAN network or VPN. An exampe is to see the "Metabox" server in OSX Finer sidebar.

* Vpn: provides access to the host through Hamachi VPN service. Requires creating an account on Hamachi's website. Read more below.


## Build

    $ metabox/build all

## Run

    $ metabox/run all


## List

    $ metabox/run ps

## Shell

    $ metabox/shell service_name (user automatically set to metauser)


## Ssh

    $ metabox/ssh service_name (user automatically set to metauser)


## Stop

    $ metabox/clean all

## Update

    $ metabox/update

Note: you will be always able to revert to a specific verion. Just note down the version hash.

## Authentication

Default user is metauser. Default password for Web and Files services: "metapass". Change it!!

For Web (with "web" service running):

    $ metabox/ssh web
    $ cd /data && sudo htpasswd -bc htpasswd metauser YOUR_NEW_PASS
    $ exit
    $ metabox/rerun web

For Files (with "files" service running):

    $ metabox/ssh files
    $ sudo bash -c "(echo YOUR_NEW_PASS; echo YOUR_NEW_PASS) | smbpasswd -a metauser"
    $ exit
    $ metabox/rerun files


## Setting up VPN

MetaBox uses Hamachi to provide VPN access which, even if requires a third-party intermediary (their servers), provides an extremely simplified setup process. Moreover, once established, the connection is directly tunneled to your MetaBox host in the majority of the cases, even across Firewalls and NATs.

To set it up, first you need to go on http://vpn.net (Hamachi's website) and signup for a free account. Then you need to create a new network. We suggest type "mesh", without password, and to require members approval. Copy the network ID (in the format xxx-yyy-zzz, if you already created the network you can find it under the "Members" section). Then:

    $ metabox/shell vpn
    $ sudo su
    $ hamachi login
    $ hamachi  # Will show status
    $ hamachi do-join xxx-yyy-zzz  # Type [enter] on password prompt
    
Now, on vpn.net, accept the new join request you will see. Then:
    
    $ hamachi  # Will show status    
    $ exit
    $ exit

The final step is to install the Hamachi client for tour laptop and join the network from there as well. Your MetaBox will be assigned a static private IP, which will never change (unless you delete MetaBox's data folder).


## Customizing services

you can easily customize services, by several different ways. While they almost all require a certain degree of confidence with forking Git repositories and using some Reyns (MetabBox's oorechstrator) advanced feature, there is a extremy simple and starightforward way.

Let's say that you want to customize the desktop service for example, by installing some libraries. You just nedd to copy the "desktop" folder in the "services" directory and name it "desktop_custom". Note that while the "_" is forbidden in MetaBox and Reyn's service names, in this case it is allowed as the servoice will still be named (and referenced to as) "desktop". In MetaBox's root folder just run:

    $ cp -a services/desktop services/desktop_custom

This will not interfere with MetaBox update system, as custom versions of services are not treated as part of MetaBox.

You can now edit the "Dockerfile" inside the "desktop_custom" folder and for example add a new library:

    RUN apt-get -y install yourlibrary 

...and you will still run and build it as the "desktop" service, i.e.:

    $ metabox/build all # Will include it in the build process
    $ metabox/run all # Will run it instead of the original desktop one
    $ metabox/build desktop # Will build it
    $ metabox/run desktop,metauser # Will run it of the original desktop one

You can also create a symbolic link to somwhere else, and in particular to a folder under version control (like Git) repository. So after the above copy command, you can do somethig like the following (always in In MetaBox's root folder):

    $ mv services/desktop_custom /path/to/your/versioned/folder/desktop_custom
	$ ln -s /path/to/your/versioned/folder/desktop_custom services/desktop_custom

We strongly encourage you to always version your services or at leas to store them a service like Dropbox which does provide minimal version control.


## Updating metabox
 You can update (or downgrade!) using the metabox/update command. Example:
 
    $ metabox/update 
    This version hash is: "787d974".
    I will now check for an update and, if found, I will rebuild MetaBox.
    If you don't like the new version, you can revert to this one by running "metabox/update 787d974"
    Do you want to proceed? (y/n)?

