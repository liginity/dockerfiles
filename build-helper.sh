#!/bin/bash

set -euo pipefail

function _build-image-usage () {
    printf "usage: build-image dockerfile [image_name]\n" >&2
}

function build-image () {
    if [ $# -lt 1 ]; then
        printf "missing argument\n" >&2
        _build-image-usage
        exit 1
    fi

    timestamp_format="%Y%m%d"

    dockerfile_name="$1"
    # if image_name is omitted, then dockerfile_name should be like "image_name-Dockerfile".
    image_name="${2:-${dockerfile_name%-Dockerfile}}"
    timestamp=$(date +"${timestamp_format}")
    tag_name="date-${timestamp}"

    docker build -f "${dockerfile_name}" -t "${image_name}" -t "${image_name}:${tag_name}" .
}

build-image "$@"
