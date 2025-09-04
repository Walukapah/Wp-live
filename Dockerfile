FROM ubuntu:22.04

# Basics install
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# code-server install
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Port expose කරන්න
EXPOSE 8080

# No password mode
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
