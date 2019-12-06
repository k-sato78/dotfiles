#!/usr/local/bin/zsh
YearMonth=$(date +%y%m)
Day="$(date +%d)-z2"

DIR="~/git/RESULTS/$YearMonth/$Day"

# echo cd ~/git/RESULTS/

if [ ! -d $DIR ];then
git pull
fi

if [ ! -d $DIR ];then
mkdir $DIR
fi


# echo cd ~/git/RESULTS/$YearMonth/$Day/
