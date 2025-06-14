#!/bin/bash
set -e

sudo apt-get install -y python3-wstool python3-rosinstall-generator python3-catkin-lint python3-pip python3-catkin-tools

mkdir -p ~/catkin_ws/src &&\
    cd ~/catkin_ws &&\
    catkin init

cd ~/catkin_ws &&\
    wstool init ~/catkin_ws/src
apt update && apt install -y python3-catkin-tools

# Generate rosinstall
rosinstall_generator --upstream mavros | tee /tmp/mavros.rosinstall && \
    rosinstall_generator mavlink | tee -a /tmp/mavros.rosinstall

# Fetch the packages
cd ~/catkin_ws && \
    wstool merge -t src /tmp/mavros.rosinstall && \
    wstool update -t src

# Clone catkin if not extending

# Install additional dependencies required by iq_sim
apt-get update && apt-get install -y \
    ros-noetic-roscpp \
    ros-noetic-std-msgs \
    ros-noetic-geometry-msgs \
    ros-noetic-sensor-msgs \
    ros-noetic-nav-msgs \
    ros-noetic-tf \
    ros-noetic-tf2 \
    ros-noetic-tf2-ros \
    ros-noetic-message-generation \
    ros-noetic-message-runtime \
    && apt-get clean

apt update  && \
    apt install -y ros-noetic-mavros ros-noetic-mavros-extras