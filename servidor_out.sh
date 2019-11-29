#!/bin/bash
echo "Servidor Rodando"
touch msgs.txt ips.txt msgens.txt
QTDLINHAOLD=0
while true
do
QTDLINHA=$(wc -l msgs.txt | cut -f1 -d ' ')

if [ "$QTDLINHAOLD" != "$QTDLINHA" ]
then
	qtd=`expr $QTDLINHA - $QTDLINHAOLD`
	clear
	cat msgs.txt
	echo "$(awk -F: '{print $1":"$2}' msgs.txt)" | sort | uniq > ips.txt
	#echo "$(cat ips.txt) $(awk -F: '{print $1":"$2}' msgs.txt)" > ips.txt
	#echo $(cat ips.txt |tr ' ' '\n'| sort | uniq | grep 10.0) > ips.txt
	awk -F: '{print $3" disse: "$4}' msgs.txt > msgens.txt
	linha=0
	for ip in $(cat ips.txt | cut -f1 -d":")
	do
		linha=`expr $linha + 1`
		tail -n $qtd msgens.txt > ultimaMsg.txt
		port=`cat ips.txt | head -n $linha | tail -n 1 | cut -f2 -d":"`
		nc  $ip $port < ultimaMsg.txt
	done
QTDLINHAOLD=$QTDLINHA
fi
done
