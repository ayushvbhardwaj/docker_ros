#!/bin/bash
set -e

# Add ROS repository
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Add ROS keys
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

# Install ROS Noetic
apt-get update && apt-get install -y \
    ros-noetic-desktop-full \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    python3-pip \
    python3-catkin-tools \
    && apt-get clean

# Initialize rosdep
rosdep init && rosdep update

# Source ROS setup file on shell startup
echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc