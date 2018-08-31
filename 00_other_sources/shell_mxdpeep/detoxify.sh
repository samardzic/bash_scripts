#!/bin/bash

if [ $# -eq 0 ]
then
	echo -e -e "\nFix filenames recursively.\n\nSyntax: $(basename $0) <folder>\n"
	exit 1
else
	if [ -n "$1" ]
	then
		if [ -d "$1" ]
		then
			echo -e "Processing: $1"
		else
			echo -e "Invalid folder: $1"
			exit 1
		fi
	fi
fi

which detox >/dev/null 2>&1
if [ $? -eq 1 ]
then
	echo -e "Installing detox package..."
	sudo apt-get install -yqq detox
fi

which detox >/dev/null 2>&1
if [ $? -eq 1 ]
then
	echo -e "ERROR: Detox is not installed!"
	exit 1
fi

detox --special -r -v -s utf_8 "$1/"
detox --special -r -v -s lower "$1/"
find "$1/" -type f -exec chmod 0644 {} \;

echo -e -e "\nDone.\n"

exit 0
