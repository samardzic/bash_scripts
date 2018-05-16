#!/bin/bash
git pull
if [ -d "../dockerimage" ]; then
  rm -rf ../dockerimage
fi
mkdir ../dockerimage
cd ..
./mvnw package
cp ./target/hub-0.0.1-SNAPSHOT.jar ./dockerimage/hub.jar
echo -e "FROM openjdk:8-jre\n EXPOSE 8080\n COPY . /usr/src/hub\n WORKDIR /usr/src/hub\n CMD java -jar hub.jar\n" >> dockerimage/Dockerfile
cd dockerimage
docker build --pull -t hub-java -f Dockerfile .
