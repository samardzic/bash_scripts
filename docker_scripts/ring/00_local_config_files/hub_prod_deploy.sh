!/bin/bash

#container name
CONTAINER_NAME=hub-java

#Exposed ports
EXP_PORT_PRIV=8080
EXP_PORT_PUB=8080

#Working directory
WORK_DIR=~/service/

#Git project location
GIT_LOCATION=~/service/hub-java

#Sources Local config file neme and location for local variables
LOCAL_CONF_PATH=~/service/Config_files/hub_java_conf.env

#Docker config file neme and location for docker variables
DOCKER_CONF_PATH=~/service/Config_files/hub_java_docker_conf.env


#Stop the previous running container/image and remove it
printf "\n===============\nStopping current running container & removing its Container and Image files...\n===============\n"
docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME && docker rmi $CONTAINER_NAME

#Load local sources variables from sources file
printf "\n===============\nLoad Local sources variables from *.env file...\n===============\n"
source $LOCAL_CONF_PATH


#Build application and create new Docker container
printf "\n\n===============\nBuilding the App and creating a new Docker container...\n===============\n"
cd $GIT_LOCATION/tools && ./build-image.sh

printf "\n\n==========================\nList Running Docker Containers.....\n===============================\n"
docker ps

printf "\n\n==========================\nList Docker Images....\n===============================\n"
docker images

#Deploy Docker application container to Registry
printf "\n\n===============\nDeploying Docker container to Registry...\n===============\n"
cd $GIT_LOCATION/tools && ./deploy-image.sh




