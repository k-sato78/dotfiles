#!/bin/bash
expect -c "
set timeout 10
spawn ftp r2
expect \"login:\"
send -- \"satoken\r\"
expect \"Password:\"
send -- \"zaq12ws\r\"
interact
"
