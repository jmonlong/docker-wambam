FROM ubuntu:20.04

MAINTAINER jmonlong@ucsc.edu

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    gcc \ 
    samtools \
    tzdata \
    build-essential \
    bzip2 \
    git \
    sudo \
    less \
    pkg-config \
    cmake \
    zlib1g-dev \
    libcurl4-openssl-dev \
    libbz2-dev \
    autoconf \
    apt-transport-https software-properties-common dirmngr gpg-agent \ 
    && rm -rf /var/lib/apt/lists/*

ENV TZ=America/Los_Angeles

WORKDIR /build

RUN git clone https://github.com/rlorigro/wambam.git && \
    cd wambam && \
    git checkout 2c24628af88af2ac58ffc1a1a2fe23b6fd014611 && \
    mkdir build && cd build && \
    cmake .. && make

ENV PATH=/build/wambam/build:$PATH

WORKDIR /home
