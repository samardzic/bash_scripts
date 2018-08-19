#!/bin/bash
source deploy-image.config
docker login $DOCKER_REGISTRY
docker tag $DOCKER_TAG $DOCKER_REGISTRY/$DOCKER_PATH
docker push $DOCKER_REGISTRY/$DOCKER_PATH

