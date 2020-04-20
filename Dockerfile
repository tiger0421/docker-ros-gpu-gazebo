ARG BASE_TAG
FROM nvidia/opengl:$BASE_TAG

ARG ROS_DISTRO
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list && \
    apt update && \
    apt install -y \
        dpkg \
        software-properties-common \
        git \
        curl \
        wget \
        lsb-release \
        python3-argcomplete \
        gnupg2 \
        dirmngr \
        g++ \
        fluid \
        python-wstool \
    && \
    echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
    wget http://packages.ros.org/ros.key -O - | apt-key add - \
    && \
    apt update && \
    apt install -y --no-install-recommends \
        ros-$ROS_DISTRO-desktop-full \
        python-catkin-tools && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

