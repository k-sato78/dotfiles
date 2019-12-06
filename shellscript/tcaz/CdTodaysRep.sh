#!/bin/bash
YearMonth=$(date +%y%m)
Day="$(date +%d)-*[0-9]"

# cd ~/git/RESULTS
# git pull

if [ -d ~/git/RESULTS/$YearMonth/$Day/ ]; then
	echo cd ~/git/RESULTS/$YearMonth/$Day/
elif [ -d  ~/git/RESULTS/$YearMonth/ ]; then
	echo cd ~/git/RESULTS/$YearMonth
else
	echo cd ~/git/RESULTS
fi
