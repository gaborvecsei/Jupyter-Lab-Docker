#!/bin/bash

# IP="$(hostname -I | awk '{ print $1 }')"
IP=0.0.0.0
echo "Starting on ip: ${IP}"
WORK_DIR="/work"

jupyter lab --allow-root --no-browser --port=8889 --ip=${IP} --notebook-dir=${WORK_DIR}
