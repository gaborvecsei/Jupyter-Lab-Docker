# Jupyter Lab Docker Container

## Setup

### Install Docker

- You'll need `docker` and `nvidia-docker2`
- Edit `/etc/docker/daemon.json`
    - Add `"default-runtime": "nvidia"` as first level entry inside the json file

### Build Base Image

- With Proxy
    - Edit `dockerfile: Dockerfile` --> `dockerfile: Dockerfile.with_proxy`
    - Add `network_mode: host` as child of the service, and `network: host` as child of `build:`
- Without Proxy
    - Be sure to have `dockerfile: Dockerfile` and not `dockerfile: Dockerfile.with_proxy`
    - Also remove `network_mode: host` and `network: host` entries

```
$ cd Base-Jupyter-Lab-GPU
$ sudo docker-compose build
```

### Build Actual Image

- With Proxy
    - Add `network_mode: host` as child of the service, and `network: host` as child of `build:`
- Without Proxy
    - Remove `network_mode: host` and `network: host` entries

- Go to the root folder and run the following:

```
$ sudo docker-compose build
$ sudo docker-compose up
```

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
