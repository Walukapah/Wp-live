# Base image
FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install dependencies
RUN apt-get update && apt-get install -y \
    ttyd \
    bash \
    curl \
    vim \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose the port ttyd will run on
EXPOSE 7681

# Command to run ttyd with bash
CMD ["ttyd", "-p", "7681", "bash"]
