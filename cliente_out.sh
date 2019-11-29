#!/bin/bash
ip=$1
port=$2
portCli=`cat porta.txt`
while true
do
   echo "Digite a msg"
   read texto
   echo "`hostname -I`:$portCli:`whoami`:$texto" > msg.txt
   nc -w 1 $ip $port < msg.txt
done
