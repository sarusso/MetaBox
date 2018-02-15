FROM metabox/xfce
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Add mouse wheel script
COPY set_mouse_wheel_speed /usr/bin
RUN mkdir /home/metauser/Desktop && chown metauser:metauser /home/metauser/Desktop
COPY Set_Mouse_Wheel_speed.desktop /home/metauser/Desktop/Set_Mouse_Wheel_speed.desktop
RUN chmod 755 /usr/bin/set_mouse_wheel_speed && apt-get install imwheel zenity -y


RUN echo "PS1=\"\u@MetaBox:\W $ \"" >> /home/metauser/.bashrc

# reyns: expose 8590/tcp
# reyns: expose 5900/tcp

