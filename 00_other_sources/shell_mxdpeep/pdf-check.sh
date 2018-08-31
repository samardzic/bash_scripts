#!/bin/bash

if [ $# -eq 0 ]
then
	echo -e -e "\nCheck validity of PDF files recursively.\n\nSyntax: $(basename $0) <folder>\n"
	exit 1
fi
if [ -n "$1" ]
then
	if [ -d "$1" ]
	then
		cd "$1"
	else
		echo -e -e "Invalid folder: $1\n"
	exit 1
	fi
fi

which pdfinfo >/dev/null 2>&1
if [ $? -eq 1 ]
then
	echo -e -e "Installing xpdf-utils package...\n"
	sudo apt-get install -yqq xpdf-utils
fi

which pdfinfo >/dev/null 2>&1
if [ $? -eq 1 ]
then
	echo -e -e "ERROR: xpdf-utils are not installed!\n"
	exit 1
fi

for i in *
do
	if [ -d "$i" ]
	then
		echo -e "Recursing into: $i"
		$0 "$i"
	fi
done

for i in *.pdf
do
	if [ -d "$i" ]
	then
#		echo -e "Recursing into: $i"
		$0 "$i"
	fi
	if [ -f "$i" ]
	then
#		echo -e "Checking: $i"
		/usr/bin/pdfinfo "$i" >/dev/null 2>&1
		if [ $? -ne 0 ]
		then
			echo -e "Invalid PDF file: $i !!!"
			mv "$i" "$i.bad"
		fi
	fi
done

exit 0
