#!/bin/sh

# Written on the 25th February 2022 by Dan Stoakes

DIR=$( cd "$(dirname "$0")" ; pwd -P )

info()
{
	echo "Usage: \`./$DIR [flags]\`"
	echo "\nwhere flags include:"
	echo "\t-h <display help message>"
	echo "\t-s <target file size to check against>"
	echo "\t-d <specify a directory to traverse>"
	echo "\t-f <file path for results to be written to>"
}

while getopts 'hs:d:f:' flag; do
	case "$flag" in
		h) info
		   exit
		   ;;
		s) size=${OPTARG}
		   ;;
		d) directory=${OPTARG}
		   ;;
		f) file=${OPTARG}
		   ;;
	esac
done

if [ -z "$size" ]; then
	size=1G
fi

if [ ! -d "$directory" ]; then
        echo "$directory is not a valid search directory"
        exit 
fi

if [ -z "$directory" ] || [ ! -d "$directory" ]; then
        directory=/
fi

cd "$directory"
echo "Finding files in directory $directory"

if [ "$file" ]; then
        echo "Writing to file $file"
        du -ht "$size" "$directory" 2>/dev/null | sort -nr > "$file"
else
        du -ht "$size" "$directory" 2>/dev/null | sort -nr
fi
