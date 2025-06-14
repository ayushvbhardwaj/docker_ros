# Base image: plain Ubuntu
FROM ubuntu:20.04

# Set environment variables to avoid user interaction during install
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Copy install scripts
COPY install/ /tmp/install/
RUN chmod +x /tmp/install/*.sh

# Run installation scripts
RUN /tmp/install/base_setup.sh
RUN /tmp/install/ros_noetic.sh
RUN /tmp/install/ardupilot.sh
RUN /tmp/install/mavros.sh
RUN /tmp/install/iq_sim.sh
RUN /tmp/install/geographiclib.sh

# Clean up install scripts
RUN rm -rf /tmp/install

# Set workspace environment variables
ENV PATH="/root/ardupilot/Tools/autotest:$PATH"
ENV PATH="/root/.local/bin:$PATH"

# Create python symlink
RUN ln -s /usr/bin/python3 /usr/bin/python

# Default shell
SHELL ["/bin/bash", "-c"]

# Set workspace environment at container startup
CMD ["/bin/bash"]