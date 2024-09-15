#!/bin/bash

# ******* MKdocs startup script ********

# ---------------------------------------------------------------------

# Description      : Bash script for mkdocs start
# Created By       : Nenad Samardzic
# ---------------------------------------------------------------------

# Start mkdocs server
echo -e "\n######################  MKdocs Start  #####################\n"
gnome-terminal -- sh -c 'cd /home/nenad/Build/documents && mkdocs serve -a 127.0.0.1:9005; bash'
