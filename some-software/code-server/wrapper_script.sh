#!/bin/bash

set -euo pipefail

port=8080
socket_path=/home/writer/.config/code_server_socket

# run code server
# code-server --disable-telemetry --disable-update-check --bind-addr 0.0.0.0:${port}
code-server --disable-telemetry --disable-update-check --socket=${socket_path} &

# bash wait for background job
wait

# exit
exit $?
