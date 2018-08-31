#!/bin/bash

# -----------------------------------------
# Remember!
# - teamcity.startup.maintenance=false
# http://goo.gl/n0jmV
# -----------------------------------------

set -e
set -o pipefail

echo -e --------------------------------------
echo -e Updating TeamCity     : [$TeamCityUrl]
echo -e Updating Tomcat       : [$tomcat]
echo -e Saving old version in : [$backup]
echo -e --------------------------------------

echo -e  ========== Downloading ==========
echo -e   "##teamcity[progressMessage 'Downloading ..']"

rm -rf teamcity
mkdir  teamcity
cd     teamcity
wget   -nv ftp://anonymous@ftp.intellij.net/pub/.teamcity/nightly/8.0.x/*.war

# Both new and old builds are of form "TeamCity-23361"
oldBuild="TeamCity-`curl $TeamCityUrl/app/rest/server/build?guest=1`"
newBuild="`ls *.war | cut -f 1 -d '.'`"


if [ "$oldBuild" = "$newBuild" ];
then
    rm -rf teamcity
    echo -e  "##teamcity[buildStatus status='SUCCESS' text='|[$newBuild|] is already installed']"
    exit
else
    echo -e  "##teamcity[progressMessage 'Updating |[$oldBuild|] to |[$newBuild|]']"
fi


echo -e  ========== Unpacking ==========

unzip *.war
rm    *.war
cd    ..

echo -e  ========== Stopping Tomcat ==========

$tomcat/bin/shutdown.sh

sleep 30

rm -rf $tomcat/logs $tomcat/temp $tomcat/work
mkdir  $tomcat/logs $tomcat/temp $tomcat/work


echo -e  ========== Moving TeamCity ==========

rm    -rf                   $backup/teamcity
mkdir -p                    $backup
mv $tomcat/webapps/teamcity $backup
mv teamcity                 $tomcat/webapps

echo -e  ========== Killing remaining Tomcat processes ==========

echo -e "Tomcat processes before:"
echo -e [`ps -Af | grep java | grep org.apache.catalina.startup.Bootstrap`]
set +e

ps -Af | grep java | grep org.apache.catalina.startup.Bootstrap | awk '{print $2}' | while read pid;
do 
    echo -e "kill $pid"
    kill $pid

    sleep 10

    echo -e "kill -9 $pid"
    kill -9 $pid
done

set -e
echo -e "Tomcat processes after:"
echo -e [`ps -Af | grep java | grep org.apache.catalina.startup.Bootstrap`]

echo -e  ========== Starting Tomcat ==========

$tomcat/bin/startup.sh

echo -e  ========== Tomcat started, sleeping for 2 minutes ==========

sleep 120

echo -e  ========== Listing [$tomcat/logs/catalina.out] ==========

cat $tomcat/logs/catalina.out

echo -e  ========== Listing [$tomcat/logs/teamcity-server.log] ==========

cat $tomcat/logs/teamcity-server.log

echo -e  ========== Listing memory and disk usage ==========

echo -e -------
echo -e Memory:
echo -e -------

free -lt

echo -e -----
echo -e Disk:
echo -e -----

df -h .

echo -e  ========== Done! Updated to [`curl $TeamCityUrl/app/rest/server/version?guest=1`] ==========
echo -e  "##teamcity[buildStatus status='SUCCESS' text='Updated to |[$newBuild|]']"
