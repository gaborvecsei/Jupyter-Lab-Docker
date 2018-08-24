FROM base_jupyter_lab_gpu 

# Build time args
ARG PROXY_IP="localhost"
ARG PROXY_PORT="8879"

USER root

# Setup Proxy
ENV http_proxy="http://${PROXY_IP}:${PROXY_PORT}"
ENV https_proxy="https://${PROXY_IP}:${PROXY_PORT}"
RUN git config --global http.proxy ${http_proxy}

ADD conf_files /conf_files

# Install required apt & python packages
RUN apt-get update && apt-get install -y vim \
                                         tmux \
                                         mongodb \
                                         nodejs \
                                         npm
## Install FFMPEG
RUN apt-get install -y ffmpeg

## Install Python packages
RUN pip3 install -r /conf_files/requirements.txt

# Install Jupyter notebook widgets
RUN npm config set proxy http://localhost:8879
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

# Modify jupyter lab config
ADD conf_files/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

