#!/bin/bash

# ******* LazyGit startup script ********

# ---------------------------------------------------------------------
# Description      : Script for starting LazyGit in specific repository
# ---------------------------------------------------------------------

# Declaring variable
REPO_LOCATION="~/Build"
REPO_NAME="gnuCash"

# Installation cleanup
echo -e "\n######################  MKdocs Start  #####################\n"
gnome-terminal -- sh -c 'cd $REPO_LOCATION/$REPO_NAME && ls > ~/zzaa.txt; bash'
