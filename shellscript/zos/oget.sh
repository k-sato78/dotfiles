#! /u/home/satoken/rocket/bin/bash

echo "write PDS name (xxxxx.xxxxx.xxxxx)"
read PDS



list=`find ${1} -type f`
for item in ${list[@]}
do
      echo "FILEPATH: "${item}
        echo "FILENAME: "`basename ${item}`
    FILENAME=$(basename ${item})
echo $FILENAME
tsocmd oget "'${item}' '$PDS($FILENAME)' CONVERT(YES)"
    done
