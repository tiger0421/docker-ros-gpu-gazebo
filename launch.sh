#!bin/bash
xhost +local:root

docker run -it --rm --name kinetic \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --gpus all \
    ros:kinetic /bin/bash

xhost -local:root
