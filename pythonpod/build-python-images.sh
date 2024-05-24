#!/bin/bash

set -euo pipefail

lib_file="../build-helper.sh"

# load the library code.
if [ -f "${lib_file}" ]; then
    . "${lib_file}"
else
    printf "${lib_file} is not found\n" >&2
    exit 1
fi

# build the images.

build-image python-Dockerfile python-cuda-pod --build-arg IMAGE_NAME=nvidia/cuda:12.4.1-runtime-ubuntu22.04
build-image ipython-Dockerfile ipython-cuda-pod --build-arg IMAGE_NAME=python-cuda-pod
build-image stem-ipython-Dockerfile stem-ipython-cuda-pod --build-arg IMAGE_NAME=ipython-cuda-pod
build-image pytorch-Dockerfile pytorch-cuda-pod --build-arg IMAGE_NAME=stem-ipython-cuda-pod
