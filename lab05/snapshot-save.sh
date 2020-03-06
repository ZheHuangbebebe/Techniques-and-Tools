#!/bin/sh

num=0
one=1

while [ -d ".snapshot.$num" ]; do
	num=`expr "$num" + "$one"`
done

mkdir ".snapshot.$num"
echo "Creating snapshot $num"

for file in *; do
	if [ `echo $file|egrep "^\."` ]; then
		continue
	fi
	if [ "$file" = "snapshot-save.sh" ]; then
		continue
	fi
	if [ "$file" = "snapshot-load.sh" ]; then
		continue
	fi
	if [ -f $file ]; then	
		cp $file ".snapshot.$num"
	fi
done
