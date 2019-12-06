#!/bin/bash
echo 'id1,sh
id2,bash' > csv









while IFS=, read v1 v2 v3
do
  echo " $v1"
done <  csv

# /Users/k.sato/ftpdoc/DC2.Z190516.DB3033/TCAZDOC/numberOfUntreatedTransaction.csv
