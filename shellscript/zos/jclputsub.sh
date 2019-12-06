#!/usr/local/bin/zsh 
#

file=$(gmktemp ~/tmp/file-XXX.txt)
filepath=$(realpath $1)
dirname=$(dirname $filepath)
basename=$(basename $filepath)
#remove dir and extension

 ftp -n << EOF
open 9.188.216.204
user mqm009 lskdjf
prompt
cd /u/mqm009/jcllib/
lcd $dirname
put $basename
bye
EOF
echo "ftp done"

ssh epa sh << EOF
tsocmd "oget '/u/mqm009/jcllib/$basename' 'MQUDS.SATO.USSJCL($basename)' TEXT"
EOF
echo "oget done"
ssh epa sh << EOF
. ./.profile
jcl_sub.rex 'MQUDS.SATO.JCLLIB($basename)'
EOF


