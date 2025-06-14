#!/bin/bash
set -e

cd ~/catkin_ws/src && \
    git clone https://github.com/Intelligent-Quads/iq_sim.git

echo "export GAZEBO_MODEL_PATH=\$GAZEBO_MODEL_PATH:/root/catkin_ws/src/iq_sim/models" >> ~/.bashrc

# Clean and build the workspace
# Configure workspace to extend ROS Noetic
cd /root/catkin_ws && catkin config --extend /opt/ros/noetic

# Ensure proper dependencies are installed
cd /root/catkin_ws && rosdep install --from-paths src --ignore-src -r -y

# Build the workspace
cd /root/catkin_ws && catkin build

echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc