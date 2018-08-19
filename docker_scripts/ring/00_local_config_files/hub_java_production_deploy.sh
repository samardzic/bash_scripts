
!/bin/bash

#container name
CONTAINER_NAME=hub-java
IMAGE_NAME=vm-ringler-app-01.cust.adfinis-sygroup.ch/ringler/hub-java

#Exposed ports
EXP_PORT_PRIV=8080
EXP_PORT_PUB=8080

#Mount NFS file system
MNT_HUB=/mnt/nfs

#Docker config file neme and location for docker variables
DOCKER_CONF_PATH=/home/execom/Hub/config_hub_java.env


#Stop the previous running container/image and remove it
printf "\n\n===============\nStopping current running container & removing its Container and Image files...\n===============\n"
docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME && docker rmi $CONTAINER_NAME



printf "\n\n==================================\nList Running Docker Containers.....\n===============================\n"
docker ps

printf "\n\n==========================\nList Docker Images....\n===============================\n"
docker images


#Run the container in (d)etached mode, give it a name we can use later to manipulate it and expose ports
printf "\n\n===============\nRunning Docker image from created container ...\n===============\n"
docker run --env-file=$DOCKER_CONF_PATH --net=host -p $EXP_PORT_PUB:$EXP_PORT_PRIV -v $MNT_HUB:$MNT_HUB -d --name $CONTAINER_NAME $IMAGE_NAME


printf "\n\n==========================\nList Running Docker Containers.....\n===============================\n"
docker ps

printf "\n\n==========================\nList Docker Images....\n===============================\n"
docker images









