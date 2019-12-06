#!/bin/bash -x
tr(){
YearMonth=$(date +%y%m)
Day1="$(date +%d)-z2"
Day2="$(date +%d)-j3"

test -d ~/git/RESULTS/$YearMonth/$Day1/ ; echo $?

if [ -d ~/git/RESULTS/$YearMonth/$Day1/ ]; then

	source CdTodaysRep1.sh

elif [ -d "~/git/RESULTS/$YearMonth/$Day2/" ]; then


	source CdTodaysRep2.sh

else
	cd ~/git/RESULTS/
	git pull

if [ -d "~/git/RESULTS/$YearMonth/$Day1/" ]; then

	source CdTodaysRep1.sh

elif [ -d "~/git/RESULTS/$YearMonth/$Day2/" ]; then


	source CdTodaysRep2.sh
fi
fi
}
