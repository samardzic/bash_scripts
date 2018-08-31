#!/bin/bash

clear

# http://stackoverflow.com/questions/821396/bash-possible-to-abort-shell-script-if-any-command-returns-a-non-zero-value
set -e
set -o pipefail


SCRIPTS_ROOT=`pwd`
TESTS_ROOT=$SCRIPTS_ROOT/tests
#GROOVY='groovy -Dgroovy.grape.report.downloads=true'
GROOVY='groovy'

echo -e "--------------------------------------------------------------"
echo -e "SCRIPTS_ROOT = [$SCRIPTS_ROOT]"
echo -e "TESTS_ROOT   = [$TESTS_ROOT]"
echo -e "GROOVY       = [$GROOVY]"
echo -e "--------------------------------------------------------------"

echo -e --== Removing old files ==--
rm -rf $TESTS_ROOT && mkdir $TESTS_ROOT && cd $TESTS_ROOT

echo -e --== Getting projects ==--

echo -e --== Getting [wiki] ==--
wget --no-check-certificate -q -O wiki.zip http://github.com/evgeny-goldin/wiki/zipball/master && unzip -q wiki.zip && rm wiki.zip && mv evgeny-goldin-wiki-* wiki
# http://twitter.com/#!/evgeny_goldin/status/140897437110910976
# git clone  git://github.com/evgeny-goldin/wiki.git    $TESTS_ROOT/wiki

echo -e --== Getting [java-twitter] ==--
svn checkout -q http://java-twitter.googlecode.com/svn/trunk/ $TESTS_ROOT/checkout/java-twitter

cd $SCRIPTS_ROOT/src/main/groovy

echo -e --== Running [links.groovy] ==--
$GROOVY mediawiki/links.groovy $TESTS_ROOT/wiki "**/*.txt"

echo -e --== Running [spaces.groovy] ==--
$GROOVY mediawiki/spaces.groovy $TESTS_ROOT/wiki "**/*.txt" true

echo -e --== Running [mvnOp.groovy] ==--
$GROOVY mvnOp.groovy $TESTS_ROOT

echo -e --== Running [svnOp.groovy] ==--
$GROOVY svnOp.groovy $TESTS_ROOT

cd $SCRIPTS_ROOT/src/test/groovy/mediawiki

echo -e --== Running [y2m.groovy] ==--
$GROOVY y2m.groovy

echo -e --== Running [g2m.groovy] ==--
$GROOVY g2m.groovy

echo -e --== Removing old files ==--
rm -rf $TESTS_ROOT
