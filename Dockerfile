FROM ghcr.io/nestybox/ubuntu-jammy-docker:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Budapest
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set timezone + locale BEFORE installing packages that may prompt
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tzdata \
        locales \
    && ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8

# Install your requested packages
RUN apt-get install -y --no-install-recommends \
        software-properties-common \
        autoconf \
        automake \
        libtool \
        git \
        git-gui \
        gitk \
        git-lfs \
        rng-tools \
        openssh-client \
        repo \
        nano \
    && git lfs install --system \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

pip install fastapi uvicorn
#COPY default.xml dev-env-install.sh /opt/workspace-init/
#RUN chmod +x /opt/workspace-init/dev-env-install.sh

