#!/bin/bash
port=`shuf -i 4000-10000 -n 1`
echo $port > porta.txt
while true
do
	nc -l -w 1 -p $port
done
