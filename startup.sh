#!/bin/sh

# Try connecting to the network share until it works
until mount.cifs //ANDY-DESKTOP/Users/atfor/OneDrive/Desktop/Shared /home/atforche/shiny-server/apps/Shiny-Budget-App/res/shared -o credentials=/etc/win-credentials,file_mode=0777,dir_mode=0777,uid=atforche
do
  sleep 2
done

# Recreate the docker container to refresh the mounted volumes
runuser -l atforche -c 'docker compose -f /home/atforche/shiny-server/docker/docker-compose.yml up -d --force-recreate'
