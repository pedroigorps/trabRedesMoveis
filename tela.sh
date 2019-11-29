#!/bin/bash
echo "Abrindo chat"

read -p "Digite o ip: " ip
read -p "Digite a porta: " port
tmux new -s tela -d
tmux new -s teclado -d

tmux new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'Chat'
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "./cliente_in.sh" C-m

tmux select-pane -t 1
tmux send-keys "./cliente_out.sh $ip $port" C-m

tmux attach -t teclado
