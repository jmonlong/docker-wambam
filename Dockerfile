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
    apt-transport-https software-properties-common dirmngr gpg-agent \ 
    && rm -rf /var/lib/apt/lists/*

ENV TZ=America/Los_Angeles

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    cmake \
    zlib1g-dev \
    libcurl4-openssl-dev \
    libbz2-dev \
    autoconf \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN git clone https://github.com/rlorigro/wambam.git && \
    mkdir wambam/build && cd wambam/build && \
    cmake .. && make

ENV PATH=/build/wambam/build:$PATH

WORKDIR /home
