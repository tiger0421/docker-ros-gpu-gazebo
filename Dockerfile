ARG BASE_TAG
FROM nvidia/opengl:${BASE_TAG}

RUN apt update && \
    apt install -y --no-install-recommends \
        lsb-release && \
    apt auroremove && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb-release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://ha.pool.sks-keyservers.net:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN if [ $(echo ${BASE_TAG} | grep 18.04) ]; then ROS_DISTRO='melodic'; else ROS_DISTRO=kinetic; fi \
    apt update && \
    apt install -y --no-install-recommends \
        ros-${ROS_DISTRO}-desktop-full && \
    apt autoremove && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/kinetic/setup.bash" >> /root/.bashrc
