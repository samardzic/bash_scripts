!/bin/bash

#container name
CONTAINER_NAME=hub-java

#Exposed ports
EXP_PORT_PRIV=8080
EXP_PORT_PUB=8080

#Working directory
WORK_DIR=/home/docker/

#Git project location
#IT_LOCATION=/home/docker/hub-java
GIT_LOCATION=~/hub-java

#Sources Local config file neme and location for local variables
#LOCAL_CONF_PATH=/home/docker/Config_files/hub_java_conf.env
LOCAL_CONF_PATH=~/Config_files/hub_java_conf.env

#Docker config file neme and location for docker variables
#DOCKER_CONF_PATH=/home/docker/Config_files/hub_java_docker_conf.env
DOCKER_CONF_PATH=~/Config_files/hub_java_docker_conf.env

#Stop the previous running container/image and remove it
printf "\n===============\nStopping current running container & removing its Container and Image files...\n===============\n"
docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME && docker rmi $CONTAINER_NAME

#Load local sources variables from sources file
printf "\n===============\nLoad Local sources variables from *.env file...\n===============\n"
source $LOCAL_CONF_PATH


#Build application and create new Docker container
printf "===============\nBuilding the App and creating a new Docker container...\n===============\n"
cd $GIT_LOCATION/tools && ./build-image.sh

#Run the container in (d)etached mode, give it a name we can use later to manipulate it and expose ports
printf "===============\nRunning Docker image from created container ...\n===============\n"
docker run --env-file=$DOCKER_CONF_PATH --net=host -p $EXP_PORT_PUB:$EXP_PORT_PRIV -d --name $CONTAINER_NAME $CONTAINER_NAME
docker ps
