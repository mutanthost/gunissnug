#!/bin/bash
if [ "$EUID" -ne 0 ] 
then
echo "silly rabbit, you have to be root"
exit
fi
# turn off globbing
set -f
# split on newlines only for loops
IFS='
'
for  log in $(find /var/log -type f);
do
# only use the log if its a text file
if [ `file $log | grep -e text | wc -l` -ne 0 ]
then
echo $log
for line in $(cat $log);
do
echo $line
# sleep for  random  duration
bc -l <<< $(bc <<< "$RANDOM  % 10")" / 40" | xargs  sleep
done
fi
done
