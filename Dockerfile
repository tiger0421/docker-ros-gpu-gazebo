ARG BASE_TAG
FROM nvidia/opengl:${BASE_TAG}

RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list && \
    apt update && \
    apt install -y --no-install-recommends \
        software-properties-common \
        git \
        curl \
        wget \
        lsb-release \
        python3-argcomplete \
        gnupg2 \
    && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(/usr/bin/lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://ha.pool.sks-keyservers.net:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
    && \
    if [ $(echo ${BASE_TAG} | grep 18.04) ]; then ROS_DISTRO='melodic'; else ROS_DISTRO=kinetic; fi \
    apt update && \
    apt install -y --no-install-recommends \
        ros-${ROS_DISTRO}-desktop-full \
        python-catkin-tools && \
    apt autoremove && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

