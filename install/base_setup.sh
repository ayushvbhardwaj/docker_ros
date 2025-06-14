#!/bin/bash
set -e

# Set up locale
apt-get update && apt-get install -y locales \
    && locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
    && apt-get clean

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Install basic tools and dependencies
apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    build-essential \
    cmake \
    git \
    wget \
    sudo \
    && apt-get clean

# Set up Git to avoid using git://
git config --global url.https://.insteadOf git://