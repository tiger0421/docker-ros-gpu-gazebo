# docker-ros-gpu-gazebo

# Support
- kinetic
- melodic

# Usage

```
curl https://raw.githubusercontent.com/tiger0421/docker-ros-gpu-gazebo/master/launch.sh > launch.sh
sudo chmod a+x launch.sh
sh launch.sh 
gazebo
```

specify a container

```
sh launch.sh tiger0421/ros-gpu-gazebo:1.0-glvnd-runtime-ubuntu18.04
```

# Build
```
DOCKER_TAG=1.0-glvnd-runtime-ubuntu18.04
ROS_DISTRO=melodic
docker build --build-arg BASE_TAG=$DOCKER_TAG --build-arg ROS_DISTRO=$ROS_DISTRO . 
```
For example  
`
docker build --build-arg BASE_TAG=1.0-glvnd-runtime-ubuntu18.04 --build-arg ROS_DISTRO=melodic . 
`
