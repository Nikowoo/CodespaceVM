FROM debian:bookworm-slim

# Install XFCE and other necessary packages
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xorg \
    xauth \
    openbox \
    wget \
    gnupg2 \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*
