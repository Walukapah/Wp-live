# Base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV USER=hfuser
ENV PASSWORD=hfpass

# Install necessary packages
RUN apt-get update && apt-get install -y \
    x11vnc \
    xvfb \
    fluxbox \
    xterm \
    wget \
    net-tools \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Create a user
RUN useradd -m $USER

# Setup VNC password
RUN mkdir -p /home/$USER/.vnc && \
    x11vnc -storepasswd $PASSWORD /home/$USER/.vnc/passwd

# Supervisor config
RUN mkdir -p /etc/supervisor/conf.d
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose VNC port
EXPOSE 5900

# Set default command
CMD ["/usr/bin/supervisord", "-n"]
