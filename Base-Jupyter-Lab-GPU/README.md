# Base Jupyter Lab image w/ access of GPUs

## Setup

- Install `docker`
- Install `nvidia-docker2` in order to use GPUs (and of course we need to have every cuda, cudnn, etc installed on the host machine. If Tensorflow-GPU wotks on the host machine then it is a good sign.)
- Edit `docker-compose.yml` in order to use *proxy* or not
