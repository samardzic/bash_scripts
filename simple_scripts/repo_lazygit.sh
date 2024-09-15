#!/bin/bash

# ******* LazyGit startup script ********

# ---------------------------------------------------------------------
# Description      : Script for starting LazyGit in specific repository
# ---------------------------------------------------------------------

# --execute, -x PROGRAM [ARGS] - Stop parsing options at this point, and interpret all subsequent
# options as a program and arguments to execute inside the terminal.
# --quiet, -q Suppress diagnostics.

# --title, -t=TITLE Set the initial terminal title.
# --working-directory=DIRNAME Set the terminal's working directory.
# --print-environment, -p Print the environment variables to interact with newly created terminals.


# Declaring variable
REPO_LOCATION="/home/ime/Build/"
REPO_NAME="gnuCash/"

# Installation cleanup
echo "\n######################  MKdocs Start  #####################\n"
# gnome-terminal --title=Nenad --working-directory="/home/ime/Build" -e sh -c 'lazygit; bash'
gnome-terminal -- sh -c 'lazygit --path ~/Build/gnuCash/; bash'
