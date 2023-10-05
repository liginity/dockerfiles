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
build-image python-Dockerfile pythonpod
build-image ipython-Dockerfile ipythonpod
build-image stem-ipython-Dockerfile stem-ipython-pod
build-image pytorch-Dockerfile pytorchpod
