#!/bin/bash
set -x
if [ -z $1 ] ; then
  cd ~/Box/TCAZ z2/z2 リグレッションテスト/テスト記述書
elif [ $1 = "j3" ];then
  A=$(echo $2 | cut -c 1-2)
  B=$(echo $2 | cut -c 3-6)
  open  ~/Box/TCAZ/TCAZ\ J3/J3\ リグレッションテスト/テスト記述書\(WAS\ V9_DB2\ V10\ NFM構成\)/$A-$B*
else
  # echo $1
  # A=$(echo $1 | cut -c 1-2)
  # cho $A
  # B=$(echo $1 | cut -c 3-6)
  open ~/Box/TCAZ\ z2/z2\ リグレッションテスト/テスト記述書/$1*
fi
