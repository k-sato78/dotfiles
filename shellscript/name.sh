#!/usr/local/bin/zsh
NAME=$1
echo $NAME
FILE=${NAME%.*}
echo $FILE
FILEA=${NAME##/}
echo $FILEA
echo ${FILE##*/}
FILE_NAME=${FILE}_CSV.csv
