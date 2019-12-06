#!/usr/local/bin/zsh
#

# file=$(gmktemp ~/tmp/file-XXX.txt)
# filepath=$(realpath $1)
# dirname=$(dirname $filepath)
# basename=$(basename $filepath)
#remove dir and extension
echo "write PDS name (xxxxx.xxxxx.xxxxx(xxxxx))"
read PDS
echo "write save name"
read name
# echo "write PDS member"
# read member
ssh epa sh << EOF
tsocmd "oput  '$PDS' '/u/mqm009/jcllib/$name' TEXT"
EOF
echo "oget done"
 ftp -n << EOF
open 9.188.216.204
user mqm009 sldkfj
prompt
cd /u/mqm009/jcllib/
lcd /Users/k.sato/jcllib/
get $name
bye
EOF
echo "ftp done"

