# Jupyter Lab Docker Container

Simple docker container which has a Jupyter Lab and the necessary packages/tools to work with GPUs

## Setup

For your own needs edit the [requirements.txt](conf_files/requirements.txt) file and also the
[Jupyter Notebook/Lab config file](conf_files/jupyter_notebook_config.py)

### Install Docker

- You'll need `docker` and `nvidia-docker2`
- Edit `/etc/docker/daemon.json`
    - Add `"default-runtime": "nvidia"` as first level entry inside the json file

### Build Base Image

- At the base image folder:

```
$ sudo docker-compose build
```

### Build Actual Image & Run it

- At the root folder:

```
$ sudo docker-compose build
$ sudo docker-compose up
```

- Once it is started to you can reach Jupyter Lab: `localhost:8889`
- Tensorboard works also on `localhost:6006`
