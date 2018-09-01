# Base Jupyter Lab image w/ access of GPUs

This is a base image which contains Jupyter Lab and everything which is needed to work with GPUs.

## Setup

- Install `docker`
- Install `nvidia-docker2` in order to use GPUs (and of course we need to have every cuda, cudnn, etc installed
on the host machine. If Tensorflow-GPU works on the host machine then it is a good sign.)
- Set the default runtime to `nvidia` for docker
- Build the image: `$ sudo docker-compose build`
