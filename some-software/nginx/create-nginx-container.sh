#!/bin/bash

set -euo pipefail

NAME=documentation-server
PORT=8000
LOCAL_HTML_ROOT=/srv/documentation/
LOCAL_DEFAULT_CONFIG=$(realpath localsites.conf)

args=(
    #docker create
    --name $NAME
    -p $PORT:80
    --restart unless-stopped

    --read-only
    --tmpfs /run --tmpfs /tmp --tmpfs /var/lib/nginx --tmpfs /var/log/nginx

    -v ${LOCAL_HTML_ROOT}:/var/www/html:ro
    -v ${LOCAL_DEFAULT_CONFIG}:/etc/nginx/sites-enabled/default:ro

    #nginxpod
)

docker create "${args[@]}" "$@" nginxpod
