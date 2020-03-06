#!/bin/sh

if [ $# != 1 ]; then
	echo "usage: ./backup filename";
	exit 0
fi

if [ ! -f $1 ]; then
	echo "file not exist"
	exit 0
fi

num=0
one=1

while [ -f ".$1.$num" ]; do
	num=`expr "$num" + "$one"`
done

cp $1 ".$1.$num"
echo "Backup of 'n.txt' saved as '.$1.$num'"
