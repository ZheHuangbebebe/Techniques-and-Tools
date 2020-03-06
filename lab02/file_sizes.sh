#!/bin/sh
printf "Small files:"
for i in $(ls -l|rev|cut -d ' ' -f5,1|rev|egrep '\b[0-4]*[0-9] '|cut -d ' ' -f2)
do
printf " $i"
done
printf "\nMedium-sized files:"
for j in $(ls -l|rev|cut -d ' ' -f5,1|rev|egrep '\b[5-9][0-9] |\b[0-4][0-9][0-9] '|cut -d ' ' -f2)
do
printf " $j"
done
printf "\nLarge files:"
for k in $(ls -l|rev|cut -d ' ' -f5,1|rev|egrep '\b[0-9][0-9][0-9]+ '|cut -d ' ' -f2)
do
printf " $k"
done
printf "\n"
