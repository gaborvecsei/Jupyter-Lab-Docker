FROM nvidia/cuda:9.0-devel-ubuntu16.04

USER root

ENV http_proxy="http://localhost:8879"

# Install basic packages & python related stuff
RUN apt-get update && apt-get install -y \
        cmake \
        git \
        libswscale-dev \
        python3 \
        python3-pip \ 
        python3-dev \
        python3-numpy \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libboost-all-dev \
        nodejs \
        ffmpeg

RUN git config --global http.proxy ${http_proxy}

# Install tensorflow dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cuda-command-line-tools-9-0 \
        cuda-cublas-9-0 \
        cuda-cufft-9-0 \
        cuda-curand-9-0 \
        cuda-cusolver-9-0 \
        cuda-cusparse-9-0 \
        curl \
        libcudnn7=7.1.4.18-1+cuda9.0 \
        libnccl2=2.2.13-1+cuda9.0 \
        libfreetype6-dev \
        libhdf5-serial-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Jupyter Lab
RUN pip3 install --proxy http://localhost:8879 jupyterlab

