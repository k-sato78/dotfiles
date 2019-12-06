#!/bin/bash
NAME=$1
FILE=${NAME%.*}
FILE_NAME=${FILE}_CSV.csv
#echo "変更前"
#cat $1
#echo "変更後"
runmqsc $2 < $NAME > ./temp.txt
  sed -e 's/^AMQ.*/ /g' -e '1,6d' -e 's/(/,/g' -e 's/  /\'$'\n/g' -e 's/)/\'$'\n/g' -e 's/ //g' ./temp.txt | sed -e '/^$/d' | sed -e '$d'| sed -e '$d'| sed -e '$d'  > ./$FILE_NAME
rm ./temp.txt

#echo $FILE_NAME
#cat $FILE_NAME
