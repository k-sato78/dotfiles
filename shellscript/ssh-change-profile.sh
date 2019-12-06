#!/bin/bash
# Ctrl-C
 trap "echo -e '\033]1337;SetProfile=default\a'" 2
# set profile 
echo -ne "\033]1337;SetProfile=$@\a"
 
# ssh login
/usr/bin/ssh "$@"
 
# set profile(default)
echo -ne "\033]1337;SetProfile=Default\a"

