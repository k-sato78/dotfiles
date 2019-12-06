#!/usr/local/bin/zsh -ex
# while read line
# do
# 	echo $line
#  	~/ShellScript/zos/tsocmd.sh "listc level\($line\)"  || gtrue
# done < $1







cat $1 | while read line
do
echo	"listc level($line)" >> ~/listds.txt

done  

