#!/bin/bash
touch msgs.txt
while true
do
	nc -l -p 9000 >> msgs.txt
	cat msgs.txt > mensagens.log
done
