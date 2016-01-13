#!/bin/bash
# Date/Timestamp format
TODAY=`date '+%Y-%m-%d'`;

# Source and Destination directories
# Note lack of trailing / makes output easier to discern
src=/usr/lib/node_modules/node-red
dst=/home/pi/Logs

# Copy files in source directory
# TODO After testing, change cp to mv
# TODO Save to USB and /log directory
for f in $src/*.csv
do
        filename=$(basename "$f")
        extension="${filename##*.}"
        filename="${filename%.*}"

        out=$filename-$TODAY.$extension
        echo "Processing: "$filename""
        echo "Renaming and moving to desktop: "$out""
        # Copy to the destination
        cp "$f" "$dst"/"$out"
done
