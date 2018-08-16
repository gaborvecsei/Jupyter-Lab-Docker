FROM jupyter/minimal-notebook

USER root

# Use Jupyter Lab
ENV JUPYTER_ENABLE_LAB=yes

# Setup Proxy
ENV http_proxy="http://localhost:8879"
ENV https_proxy="https://localhost:8879"
RUN git config --global http.proxy http://localhost:8879

ADD conf_files /conf_files

# Install required apt & python packages
RUN apt-get update && apt-get install -y vim tmux curl \
                      mongodb software-properties-common
RUN pip install -r /conf_files/requirements.txt

# Install additional jupyter kernels
# R
RUN conda install -c r r-irkernel -y

# Clone Redvine to work folder
WORKDIR /home/jovyan/work
RUN git clone http://github.conti.de/ADAS-Machine-Learning/redvine.git 

USER jovyan

# Modify jupyter lab config
RUN cat /conf_files/jupyter_notebook_config.py >> /home/jovyan/.jupyter/jupyter_notebook_config.py
 
