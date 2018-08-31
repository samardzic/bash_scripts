#!/bin/bash

session="bg-apps"
logs_dir=~/session-logs

mkdir -p "$logs_dir"

# Start session if it doesn't exist
if (tmux has-session -t "$session" 2> /dev/null); then
	echo -e "Session $session exists."
else
	echo -e "Starting session $session."
	# tmux doesn't allow nested sessions, and if this situation is not caught here then the
	# 'tmux new-session' command will fail.  Although, since the session is being started
	# detached, it is probably okay.  So maybe it would be better to just temporarily unset the
	# TMUX variable before running new-session.
	if [ "$TMUX" != "" ]; then
		echo -e "Error: cannot start session from within tmux."
		exit
	fi
	tmux new-session -d -s "$session"
fi

function run_in_window {
	name="$1"
	cmd="$2"
	if (tmux list-windows -t "$session" -F '#{window_name}' |grep "^$name\$" >/dev/null); then
		echo -e "Already running: $name"
	else
		echo -e "Starting: $name"
		echo -e "Started at $(date)" >  $logs_dir/$name
		echo -e "Command: $cmd"      >> $logs_dir/$name
		echo -e "-------"            >> $logs_dir/$name
		# Create new window and run command.
		tmux new-window -t "$session" -n "$name" "$cmd"
		# Start logging.
		tmux pipe-pane  -t "$session:$name" "cat >> \"$logs_dir/$name\""
	fi
}

function start_something {
	name="$1"

	case "$name" in
	gkrellm)     run_in_window "$name" "gkrellm" ;;
	chrome)      run_in_window "$name" "google-chrome --disk-cache-size=50000000 --media-cache-size=50000000 --disk-cache-dir=/mnt/ramdisk/chrome-cache --disable-webgl --enable-seccomp-sandbox" ;;
	thunderbird) run_in_window "$name" "thunderbird" ;;
	akregator)   run_in_window "$name" "akregator --nofork --hide-mainwindow" ;;
	sage)        run_in_window "$name" "~/apps/sage/sage -n" ;;
	*)           echo -e "Unrecognized command: $1"
	esac
}

if [ "$1" = "" ]; then
	start_something "gkrellm"
	start_something "chrome"
	start_something "thunderbird"
	start_something "akregator"
else
	start_something "$1"
fi
