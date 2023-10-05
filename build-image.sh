#!/bin/bash

script_path=$(realpath "$0")
# echo "${script_path}"
script_dir=$(dirname "${script_path}")
lib_file="${script_dir}/build-helper.sh"

# load the library code.
if [ -f "${lib_file}" ]; then
    . "${lib_file}"
else
    printf "${lib_file} is not found\n" >&2
    exit 1
fi

build-image "$@"
