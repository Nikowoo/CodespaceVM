FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

# Install dependencies for Steam
RUN sudo apt-get update \
 && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   libgtk2.0-0 \
   libgtk-3-0 \
   libnotify-dev \
   libgconf-2-4 \
   libnss3 \
   libxss1 \
   libasound2 \
   libxtst6 \
   xauth \
   xvfb \
   wget \
 && sudo rm -rf /var/lib/apt/lists/*

# Install Steam
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb \
 && sudo dpkg -i steam.deb || sudo apt-get -f install -y \
 && sudo rm steam.deb

# Expose ports for noVNC
EXPOSE 5901
EXPOSE 6080
