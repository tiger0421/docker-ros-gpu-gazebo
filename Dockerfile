ARG BASE_TAG
FROM nvidia/opengl:${BASE_TAG}

RUN apt-get update && \
    apt-get install -y --no-install-recommends lsb-release \
    gnupg \
    gnupg2 && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(/usr/bin/lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://ha.pool.sks-keyservers.net:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN if [ $(echo ${BASE_TAG} | grep 18.04) ]; then ROS_DISTRO='melodic'; else ROS_DISTRO=kinetic; fi \
    apt-get update && \
    apt-get install -y --no-install-recommends ros-${ROS_DISTRO}-desktop-full && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/kinetic/setup.bash" >> /root/.bashrc
