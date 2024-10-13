FROM ubuntu:22.04

# Install dependencies for noVNC and Steam
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
   xauth \
   xvfb \
   libgtk2.0-0 \
   libgtk-3-0 \
   libnotify-dev \
   libgconf-2-4 \
   libnss3 \
   libxss1 \
   libasound2 \
   libxtst6 \
   wget \
   sudo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install noVNC dependencies (e.g., LXDE desktop environment)
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
   lxde \
   novnc \
   websockify \
   tightvncserver \
 && apt-get clean

# Install Steam
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb \
 && dpkg -i steam.deb || apt-get -f install -y \
 && rm steam.deb

# Expose noVNC port
EXPOSE 6080
