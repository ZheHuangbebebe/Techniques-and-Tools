#!/bin/sh

if [[ "$#" -ne 2 ]]
then
	echo "Usage: ./echon.sh <number of lines> <string>"
	exit 1
fi

if ! [[ "$1" =~ ^[0-9]+$ ]]
then
	echo "./echon.sh: argument1 must be a non-negative integer"
	exit 1
fi

for n in $(seq 1 1 $1)
do
	echo "$2"
done
