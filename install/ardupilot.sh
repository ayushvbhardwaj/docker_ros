#!/bin/bash
set -e

# Install ArduPilot and prerequisites
git clone https://github.com/ArduPilot/ardupilot.git /root/ardupilot && \
    cd /root/ardupilot && \
    git checkout Copter-4.0.4 && \
    git submodule update --init --recursive

# Run prerequisites in a separate layer
cd /root/ardupilot && \
    sed -i 's/sudo usermod -a -G dialout/sudo usermod -a -G dialout root/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/pip2/pip3/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-pip/python3-pip/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-matplotlib/python3-matplotlib/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-serial/python3-serial/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-scipy/python3-scipy/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-opencv/python3-opencv/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-empy/python3-empy/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-numpy/python3-numpy/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-pyparsing/python3-pyparsing/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-dev/python3-dev/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i 's/python-setuptools/python3-setuptools/' Tools/environment_install/install-prereqs-ubuntu.sh && \
    Tools/environment_install/install-prereqs-ubuntu.sh -y

cd /root/ardupilot && \
    usermod -a -G dialout root && \
    apt-get clean