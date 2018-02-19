FROM metabox/xfce
MAINTAINER Stefano Alberto Russo <stefano.russo@gmail.com>

# Add some dependencies
RUN apt-get install imwheel zenity x11-xserver-utils -y

# Create the Desktop
RUN mkdir /home/metauser/Desktop && chown metauser:metauser /home/metauser/Desktop

# Add mouse scrolling script
COPY set_mouse_scrolling_speed /usr/bin/
COPY Set_Mouse_Scrolling_Speed.desktop /home/metauser/Desktop/

# Add Display Resolution stuff
COPY add_display_resolution /usr/bin/
COPY add_display_resolution_gui /usr/bin/
COPY Set_Display_Resolution.desktop /home/metauser/Desktop/
COPY Add_Display_Resolution.desktop /home/metauser/Desktop/

# Make all the above scripts executable
RUN chmod 755 /usr/bin/add_display_resolution && chmod 755 /usr/bin/add_display_resolution_gui && chmod 755 /usr/bin/set_mouse_scrolling_speed 

# Correct ownership of Desktop shortcuts
RUN chown -R metauser:metauser /home/metauser/Desktop/

# Shorter bash prompt
RUN echo "PS1=\"\u@MetaBox:\W $ \"" >> /home/metauser/.bashrc

# reyns: expose 8590/tcp
# reyns: expose 5900/tcp

