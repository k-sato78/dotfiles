#!/usr/local/bin/zsh

ssh -t -t epa	<< EOF
source ~/.profile
tsocmd "$1"
exit
exit
EOF
