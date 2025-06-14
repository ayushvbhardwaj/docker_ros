 docker_ros_gazebo

A Dockerized development environment for **ROS Noetic**, **ArduPilot**, **MAVROS**, and **Gazebo**.  
Ideal for autonomous drone simulation, SITL testing, MAVLink communication, and robotics R&D — all containerized for easy reproducibility and deployment.

---

## 🚀 Features

- ✅ ROS Noetic (Ubuntu 20.04)
- ✅ ArduPilot SITL (v4.0.4+)
- ✅ MAVROS & MAVLink protocol support
- ✅ Gazebo 9 with IQ_Sim integration
- ✅ Pre-configured Catkin workspace
- ✅ Docker-based: isolated, reproducible, and fast

---


## ⚡ Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/ayushvbhardwaj/docker_ros.git
cd docker_ros  

2. Build the Docker image
docker build -t ros-ardupilot .

3. Run the container
docker run -it ros-ardupilot
./run_dev.sh

🛠️ Requirements
	•	Docker (latest)
	•	Git
	•	Linux/macOS (WSL2 or native)


🧪 Running SITL Simulation (Optional)
1. Inside the container:
cd /root/ardupilot/ArduCopter
sim_vehicle.py -v ArduCopter -f gazebo-iris --console --map

2.	Launch Gazebo with IQSim:
roslaunch iq_sim some_world.launch
