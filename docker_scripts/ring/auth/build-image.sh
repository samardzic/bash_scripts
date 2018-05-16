#!/bin/bash
git pull
if [ -d "../dockerimage" ]; then
  rm -rf ../dockerimage
fi
mkdir ../dockerimage
cd ..
./mvnw package
cp ./target/auth-0.0.1-SNAPSHOT.jar ./dockerimage/auth.jar
echo -e "FROM openjdk:8-jre\n EXPOSE 9000\n COPY . /usr/src/auth\n WORKDIR /usr/src/auth\n CMD java -jar auth.jar\n" >> dockerimage/Dockerfile
cd dockerimage
docker build --pull -t auth-java -f Dockerfile .
