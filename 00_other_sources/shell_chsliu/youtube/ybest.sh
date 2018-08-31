#!/bin/sh

# for last; do true; done
# echo -e $last

prefix=$1
shift

youtube-dl -c -i -f best -o "$prefix/%(title)s (%(height)sp).%(ext)s" --prefer-ffmpeg $*
