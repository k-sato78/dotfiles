#!/bin/bash

host=$1
user="satoken"
pass="zaq12ws"

expect -c "
set timeout 10
spawn telnet $host
expect \"login:\"
send -- \"$user\r\"
expect \"Password:\"
send -- \"$pass\r\"
interact
"
