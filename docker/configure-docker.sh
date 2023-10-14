#!/bin/bash
mkdir -p $HOME/sp/logs

docker volume create steampipe_data
docker volume create steampipe_internal
docker volume create steampipe_plugins

alias sp="docker run \
  -it \
  --rm \
  --name steampipe \
  --mount type=bind,source=$CONFIG,target=/home/steampipe/.steampipe\
  -v steampipe_data:/home/steampipe/.steampipe/db/14.2.0/data \
  -v steampipe_internal:/home/steampipe/.steampipe/internal \
  ghcr.io/turbot/steampipe"