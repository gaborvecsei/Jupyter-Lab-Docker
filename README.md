# Jupyter Lab Docker Container

## Setup

- You'll need `docker` and `nvidia-docker2`
- Edit `/etc/docker/daemon.json`
    - Add `"default-runtime": "nvidia"` as first level entry inside the json file
- Build the base image
    - `$ cd Base-Jupyter-Lab-GPU`
    - `$ sudo docker-compose build`
- Build the actual image
    - Go to the root folder
    - `$ sudo docker-compose build`
    - Run it: `$ sudo docker-compose up -d`

## Usage

If you would like to install a python module or an apt package, please report it, as the Dockerfile needs to be modified. Installing it directly inside the container is only a temporary solution.

### Work 

1. Create your own `work folder`
2. Create a personal copy (or clone it) of the `redvine` folder into your own folder (`cp -R redvine <YOUR_FOLDER>`)
3. Work inside your own folder & Enjoy

## Supported Languages

- Python 3.6
- R

## Problems

- Inside `docker-compose.yml` `network_mode: host` is problematic
    - If you are not using any proxy please remove this key in the file
