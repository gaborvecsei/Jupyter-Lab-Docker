FROM base_jupyter_lab_gpu 

USER root

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
# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

# Modify jupyter lab config
ADD conf_files/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Create entrypoint with tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

