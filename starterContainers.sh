#!/bin/bash

containers=("pgdb" "pgadmin" "nflix-api-users" "nflix-api-movies" "nflix-api-gateway" "nflix-web")
for i in "${containers[@]}";
do
	sudo docker start $i
done
sudo docker ps
