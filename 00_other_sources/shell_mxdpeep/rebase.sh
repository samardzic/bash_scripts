#!/bin/bash
#@author Filip Oščádal <cio@gscloud.cz>

git checkout --orphan latest_branch
git add -A
git commit -am "rebased"
git branch -D master
git branch -m master
git push -f origin master
