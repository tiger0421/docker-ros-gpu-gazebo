# docker-ros-gpu-gazebo

# Support
- kinetic
- melodic

# Usage

```
curl https://raw.githubusercontent.com/tiger0421/docker-ros-gpu-gazebo/master/launch.sh > launch.sh
sudo chmod a+x launch.sh
launch.sh 
gazebo
```

specify a container

```
launch.sh tiger0421/ros-gpu-gazebo:1.1-glvnd-runtime-ubuntu16.04
```

# Build
```
DOCKER_TAG=1.0-glvnd-runtime-ubuntu18.04
ROS_DISTRO=melodic
docker build --build-arg BASE_TAG=$DOCKER_TAG --build-arg ROS_DISTRO=$ROS_DISTRO . 
```
