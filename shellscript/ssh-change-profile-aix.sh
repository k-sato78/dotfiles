#!/bin/bash
  
# Ctrl-C
 trap "echo -e '\033]1337;SetProfile=default\a'" 2
# set profile 
echo -ne "\033]1337;SetProfile=aix\a"
 
# ssh login
sshpass -p db2inst1 ssh db2inst1@9.188.31.84

 
# set profile(default)
echo -ne "\033]1337;SetProfile=Default\a"

