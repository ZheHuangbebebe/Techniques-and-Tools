#!/bin/sh

while read string
do
echo $string|sed  's/[0-4]/</g'|sed  's/[6-9]/>/g'
done
